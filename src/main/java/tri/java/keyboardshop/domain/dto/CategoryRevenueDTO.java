package tri.java.keyboardshop.domain.dto;

public class CategoryRevenueDTO {
    private String category;
    private double revenue;
    private double percentage;

    public CategoryRevenueDTO(String category, double revenue, double percentage) {
        this.category = category;
        this.revenue = revenue;
        this.percentage = percentage;
    }

    // Getters and Setters
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
}