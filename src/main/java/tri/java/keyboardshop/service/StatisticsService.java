package tri.java.keyboardshop.service;

import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.TimeRangeType;
import tri.java.keyboardshop.domain.dto.CategoryRevenueDTO;
import tri.java.keyboardshop.domain.dto.ChartDataDTO;
import tri.java.keyboardshop.domain.dto.RevenueStatsDTO;
import tri.java.keyboardshop.repository.OrderDetailRepository;
import tri.java.keyboardshop.repository.OrderRepository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class StatisticsService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public StatisticsService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public ChartDataDTO getRevenueByTimeRange(TimeRangeType rangeType, LocalDate startDate, LocalDate endDate) {
        List<RevenueStatsDTO> stats = new ArrayList<>();
        String dateFormat;

        switch (rangeType) {
            case DAY:
                dateFormat = "yyyy-MM-dd";
                stats = orderRepository.findRevenueByDay(startDate, endDate);
                break;
            case MONTH:
                dateFormat = "yyyy-MM";
                stats = orderRepository.findRevenueByMonth(startDate, endDate);
                break;
            case YEAR:
                dateFormat = "yyyy";
                stats = orderRepository.findRevenueByYear(startDate, endDate);
                break;
            default:
                throw new IllegalArgumentException("Invalid time range type");
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
        List<String> labels = stats.stream()
                .map(s -> s.getTimePeriod())
                .collect(Collectors.toList());
        List<Double> data = stats.stream()
                .map(s -> s.getRevenue())
                .collect(Collectors.toList());

        return new ChartDataDTO(labels, data);
    }

    public ChartDataDTO getCategoryRevenueByMonth(int year, int month) {
        List<Object[]> rawData = orderDetailRepository.findRevenueByCategory(year, month);
        List<CategoryRevenueDTO> stats = new ArrayList<>();
        double totalRevenue = rawData.stream()
                .mapToDouble(row -> (Double) row[1])
                .sum();

        for (Object[] row : rawData) {
            String category = (String) row[0];
            double revenue = (Double) row[1];
            double percentage = (revenue / totalRevenue) * 100;
            stats.add(new CategoryRevenueDTO(category, revenue, percentage));
        }

        List<String> labels = stats.stream()
                .map(CategoryRevenueDTO::getCategory)
                .collect(Collectors.toList());
        List<Double> data = stats.stream()
                .map(CategoryRevenueDTO::getRevenue)
                .collect(Collectors.toList());

        return new ChartDataDTO(labels, data);
    }
}