package tri.java.keyboardshop.domain.dto;

import java.util.List;

public class ChartDataDTO {
    private List<String> labels;
    private List<Double> data;

    public ChartDataDTO(List<String> labels, List<Double> data) {
        this.labels = labels;
        this.data = data;
    }

    // Getters and Setters
    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<Double> getData() {
        return data;
    }

    public void setData(List<Double> data) {
        this.data = data;
    }
}