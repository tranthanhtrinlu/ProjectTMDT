package tri.java.keyboardshop.service;

import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.TimeRangeType;
import tri.java.keyboardshop.domain.dto.CategoryRevenueDTO;
import tri.java.keyboardshop.domain.dto.ChartDataDTO;
import tri.java.keyboardshop.domain.dto.RevenueStatsDTO;
import tri.java.keyboardshop.repository.OrderDetailRepository;
import tri.java.keyboardshop.repository.OrderRepository;

import java.math.BigDecimal;
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
        System.out.println("=== REVENUE STATS DEBUG ===");
        System.out.println("Range Type: " + rangeType);
        System.out.println("Start Date: " + startDate);
        System.out.println("End Date: " + endDate);
        
        List<Object[]> rawData = new ArrayList<>();
        String dateFormat;

        // Convert LocalDate to String for native queries
        String startDateStr = startDate.toString();
        String endDateStr = endDate.toString();
        
        System.out.println("Date strings: " + startDateStr + " to " + endDateStr);

        try {
            switch (rangeType) {
                case DAY:
                    dateFormat = "yyyy-MM-dd";
                    rawData = orderRepository.findCombinedRevenueByDay(startDateStr, endDateStr);
                    break;
                case MONTH:
                    dateFormat = "yyyy-MM";
                    rawData = orderRepository.findCombinedRevenueByMonth(startDateStr, endDateStr);
                    break;
                case YEAR:
                    dateFormat = "yyyy";
                    rawData = orderRepository.findCombinedRevenueByYear(startDateStr, endDateStr);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid time range type");
            }
            
            System.out.println("Raw data size: " + rawData.size());
            
            // Convert Object[] results to DTO format
            List<String> labels = new ArrayList<>();
            List<Double> data = new ArrayList<>();
            
            for (Object[] row : rawData) {
                String timePeriod = (String) row[0];
                // Handle both BigDecimal and Double types
                Number revenueNumber = (Number) row[1];
                Double revenue = revenueNumber != null ? revenueNumber.doubleValue() : 0.0;
                
                System.out.println("Processing: " + timePeriod + " = " + revenue);
                
                labels.add(timePeriod);
                data.add(revenue);
            }
            
            System.out.println("Final labels: " + labels);
            System.out.println("Final data: " + data);
            System.out.println("=== END REVENUE STATS DEBUG ===");

            return new ChartDataDTO(labels, data);
            
        } catch (Exception e) {
            System.err.println("Error in getRevenueByTimeRange: " + e.getMessage());
            e.printStackTrace();
            return new ChartDataDTO(new ArrayList<>(), new ArrayList<>());
        }
    }

    public ChartDataDTO getCategoryRevenueByMonth(int year, int month) {
        System.out.println("=== CATEGORY STATS DEBUG ===");
        System.out.println("Year: " + year + ", Month: " + month);
        
        try {
            List<Object[]> rawData = orderDetailRepository.findCombinedRevenueByCategory(year, month);
            System.out.println("Category raw data size: " + rawData.size());
            
            List<CategoryRevenueDTO> stats = new ArrayList<>();
            
            // Calculate total revenue first
            double totalRevenue = 0.0;
            for (Object[] row : rawData) {
                Number revenueNumber = (Number) row[1];
                double revenue = revenueNumber != null ? revenueNumber.doubleValue() : 0.0;
                totalRevenue += revenue;
            }
            
            System.out.println("Total revenue: " + totalRevenue);

            // Process each category
            for (Object[] row : rawData) {
                String category = (String) row[0];
                Number revenueNumber = (Number) row[1];
                double revenue = revenueNumber != null ? revenueNumber.doubleValue() : 0.0;
                double percentage = totalRevenue > 0 ? (revenue / totalRevenue) * 100 : 0.0;
                
                System.out.println("Category: " + category + " = " + revenue + " (" + percentage + "%)");
                
                stats.add(new CategoryRevenueDTO(category, revenue, percentage));
            }

            List<String> labels = stats.stream()
                    .map(CategoryRevenueDTO::getCategory)
                    .collect(Collectors.toList());
            List<Double> data = stats.stream()
                    .map(CategoryRevenueDTO::getRevenue)
                    .collect(Collectors.toList());
                    
            System.out.println("Category labels: " + labels);
            System.out.println("Category data: " + data);
            System.out.println("=== END CATEGORY STATS DEBUG ===");

            return new ChartDataDTO(labels, data);
            
        } catch (Exception e) {
            System.err.println("Error in getCategoryRevenueByMonth: " + e.getMessage());
            e.printStackTrace();
            return new ChartDataDTO(new ArrayList<>(), new ArrayList<>());
        }
    }
}