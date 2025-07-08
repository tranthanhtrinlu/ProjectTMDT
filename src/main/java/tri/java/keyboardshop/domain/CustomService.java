package tri.java.keyboardshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "custom_services")
public class CustomService {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(name = "service_name", nullable = false, length = 100)
    private String serviceName;
    
    @Column(name = "service_description", columnDefinition = "TEXT")
    private String serviceDescription;
    
    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;
    
    @Column(name = "is_active")
    private boolean isActive = true;
    
    // Constructors
    public CustomService() {}
    
    public CustomService(String serviceName, String serviceDescription, BigDecimal price) {
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
        this.price = price;
    }
    
    // Getters and Setters
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public String getServiceName() {
        return serviceName;
    }
    
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    
    public String getServiceDescription() {
        return serviceDescription;
    }
    
    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }
    
    public BigDecimal getPrice() {
        return price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public boolean isActive() {
        return isActive;
    }
    
    public void setActive(boolean active) {
        isActive = active;
    }
} 