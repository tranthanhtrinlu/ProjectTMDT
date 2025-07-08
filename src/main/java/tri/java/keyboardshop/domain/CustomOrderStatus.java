package tri.java.keyboardshop.domain;

public enum CustomOrderStatus {
    PENDING("Đang chờ xử lý"),
    PROCESSING("Đang thực hiện"),
    READY("Hoàn thành"),
    SHIPPED("Đã giao hàng"),
    CANCELLED("Đã hủy");
    
    private String displayName;
    
    CustomOrderStatus(String displayName) {
        this.displayName = displayName;
    }
    
    public String getDisplayName() {
        return displayName;
    }
} 