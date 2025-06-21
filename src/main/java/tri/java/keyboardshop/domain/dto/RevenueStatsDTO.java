package tri.java.keyboardshop.domain.dto;

public class RevenueStatsDTO {
    private String timePeriod;
    private double revenue;

    public RevenueStatsDTO(String timePeriod, double revenue) {
        this.timePeriod = timePeriod;
        this.revenue = revenue;
    }

    // Getters and Setters
    public String getTimePeriod() {
        return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}