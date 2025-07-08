package tri.java.keyboardshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

<<<<<<< Updated upstream
import tri.java.keyboardshop.service.UserService;
=======
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
>>>>>>> Stashed changes

@Controller
public class DashboardController {

    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countProducts", this.userService.countProducts());
        model.addAttribute("countOrders", this.userService.countOrders());
        return "admin/dashboard/show";
    }
<<<<<<< Updated upstream
}
=======

    @GetMapping("/admin/statistics")
    @PreAuthorize("hasRole('ADMIN')")
    public String getStatistics(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countProducts", this.userService.countProducts());
        model.addAttribute("countOrders", this.userService.countOrders());
        return "admin/statistics/show";
    }

    @GetMapping("/admin/statistics/test")
    @PreAuthorize("hasRole('ADMIN')")
    public String getStatisticsTest(Model model) {
        return "admin/statistics/test";
    }

    @GetMapping("/api/revenue-stats")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ChartDataDTO> getRevenueStats(
            @RequestParam("rangeType") TimeRangeType rangeType,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate) {
        
        try {
            // Validate and set default dates if empty
            LocalDate start;
            LocalDate end;
            
            if (startDate == null || startDate.trim().isEmpty()) {
                end = LocalDate.now();
                start = end.minusDays(6); // Default to last 7 days
            } else if (endDate == null || endDate.trim().isEmpty()) {
                start = LocalDate.parse(startDate);
                end = LocalDate.now();
            } else {
                start = LocalDate.parse(startDate);
                end = LocalDate.parse(endDate);
            }
            
            ChartDataDTO data = statisticsService.getRevenueByTimeRange(rangeType, start, end);
            return ResponseEntity.ok(data);
            
        } catch (Exception e) {
            // Return empty data instead of error
            ChartDataDTO emptyData = new ChartDataDTO(new ArrayList<>(), new ArrayList<>());
            return ResponseEntity.ok(emptyData);
        }
    }

    @GetMapping("/api/category-revenue")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ChartDataDTO> getCategoryRevenue(
            @RequestParam(value = "year", required = false) Integer year,
            @RequestParam(value = "month", required = false) Integer month) {
        
        try {
            // Set default values if parameters are null or invalid
            LocalDate now = LocalDate.now();
            int actualYear = (year != null && year > 0) ? year : now.getYear();
            int actualMonth = (month != null && month >= 1 && month <= 12) ? month : now.getMonthValue();
            
            ChartDataDTO data = statisticsService.getCategoryRevenueByMonth(actualYear, actualMonth);
            return ResponseEntity.ok(data);
            
        } catch (Exception e) {
            // Return empty data instead of error
            ChartDataDTO emptyData = new ChartDataDTO(new ArrayList<>(), new ArrayList<>());
            return ResponseEntity.ok(emptyData);
        }
    }

    @GetMapping("/api/debug-revenue")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, Object>> debugRevenue() {
        Map<String, Object> debug = new HashMap<>();
        
        try {
            // Test today's revenue
            LocalDate today = LocalDate.now();
            LocalDate weekAgo = today.minusDays(6);
            
            ChartDataDTO revenueData = statisticsService.getRevenueByTimeRange(TimeRangeType.DAY, weekAgo, today);
            debug.put("revenueData", revenueData);
            
            // Test category revenue
            ChartDataDTO categoryData = statisticsService.getCategoryRevenueByMonth(today.getYear(), today.getMonthValue());
            debug.put("categoryData", categoryData);
            
            debug.put("success", true);
            debug.put("dateRange", weekAgo + " to " + today);
            debug.put("year", today.getYear());
            debug.put("month", today.getMonthValue());
            
        } catch (Exception e) {
            debug.put("success", false);
            debug.put("error", e.getMessage());
            debug.put("stackTrace", e.getStackTrace());
        }
        
        return ResponseEntity.ok(debug);
    }
    
    @GetMapping("/api/test-raw-data")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, Object>> testRawData() {
        Map<String, Object> result = new HashMap<>();
        
        try {
            LocalDate today = LocalDate.now();
            LocalDate weekAgo = today.minusDays(6);
            String startDateStr = weekAgo.toString();
            String endDateStr = today.toString();
            
            // Test direct repository calls
            java.lang.reflect.Method findCombinedRevenueByDay = 
                this.statisticsService.getClass().getDeclaredField("orderRepository").getType()
                .getMethod("findCombinedRevenueByDay", String.class, String.class);
            
            result.put("success", true);
            result.put("message", "Use SQL debug script to check data directly");
            result.put("dateRange", startDateStr + " to " + endDateStr);
            
        } catch (Exception e) {
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        
        return ResponseEntity.ok(result);
    }
}
>>>>>>> Stashed changes
