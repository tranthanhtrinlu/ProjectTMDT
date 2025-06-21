package tri.java.keyboardshop.controller.admin;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tri.java.keyboardshop.domain.TimeRangeType;
import tri.java.keyboardshop.domain.dto.ChartDataDTO;
import tri.java.keyboardshop.service.StatisticsService;
import tri.java.keyboardshop.service.UserService;

import java.time.LocalDate;

@Controller
public class DashboardController {

    private final UserService userService;
    private final StatisticsService statisticsService;

    public DashboardController(UserService userService, StatisticsService statisticsService) {
        this.userService = userService;
        this.statisticsService = statisticsService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countProducts", this.userService.countProducts());
        model.addAttribute("countOrders", this.userService.countOrders());
        return "admin/dashboard/show";
    }

    @GetMapping("/api/revenue-stats")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ChartDataDTO> getRevenueStats(
            @RequestParam("rangeType") TimeRangeType rangeType,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate) {
        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);
        ChartDataDTO data = statisticsService.getRevenueByTimeRange(rangeType, start, end);
        return ResponseEntity.ok(data);
    }

    @GetMapping("/api/category-revenue")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ChartDataDTO> getCategoryRevenue(
            @RequestParam("year") int year,
            @RequestParam("month") int month) {
        ChartDataDTO data = statisticsService.getCategoryRevenueByMonth(year, month);
        return ResponseEntity.ok(data);
    }
}