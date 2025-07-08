package tri.java.keyboardshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "custom_orders")
public class CustomOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "base_keyboard_id")
    private Product baseKeyboard;
    
    @ManyToOne
    @JoinColumn(name = "selected_keycap_id")
    private Product selectedKeycap;
    
    @Column(name = "selected_switch_type")
    private String selectedSwitchType;
    
    @ManyToOne
    @JoinColumn(name = "selected_kit_id")
    private Product selectedKit;
    
    @Column(name = "lubing_service")
    private boolean lubingService = false;
    
    @Column(name = "stabilizer_tuning")
    private boolean stabilizerTuning = false;
    
    @Column(name = "keycap_customization")
    private boolean keycapCustomization = false;
    
    @Column(name = "cable_customization")
    private boolean cableCustomization = false;
    
    @Column(name = "case_modding")
    private boolean caseModding = false;
    
    @Column(name = "custom_notes", columnDefinition = "TEXT")
    private String customNotes;
    
    @Column(name = "total_price", precision = 10, scale = 2)
    private BigDecimal totalPrice;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private CustomOrderStatus status = CustomOrderStatus.PENDING;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
    
    // Constructors
    public CustomOrder() {}
    
    public CustomOrder(User user, Product baseKeyboard) {
        this.user = user;
        this.baseKeyboard = baseKeyboard;
        this.totalPrice = BigDecimal.valueOf(baseKeyboard.getPrice());
    }
    
    // Getters and Setters
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public Product getBaseKeyboard() {
        return baseKeyboard;
    }
    
    public void setBaseKeyboard(Product baseKeyboard) {
        this.baseKeyboard = baseKeyboard;
    }
    
    public Product getSelectedKeycap() {
        return selectedKeycap;
    }
    
    public void setSelectedKeycap(Product selectedKeycap) {
        this.selectedKeycap = selectedKeycap;
    }
    
    public String getSelectedSwitchType() {
        return selectedSwitchType;
    }
    
    public void setSelectedSwitchType(String selectedSwitchType) {
        this.selectedSwitchType = selectedSwitchType;
    }
    
    public Product getSelectedKit() {
        return selectedKit;
    }
    
    public void setSelectedKit(Product selectedKit) {
        this.selectedKit = selectedKit;
    }
    
    public boolean isLubingService() {
        return lubingService;
    }
    
    public void setLubingService(boolean lubingService) {
        this.lubingService = lubingService;
    }
    
    public boolean isStabilizerTuning() {
        return stabilizerTuning;
    }
    
    public void setStabilizerTuning(boolean stabilizerTuning) {
        this.stabilizerTuning = stabilizerTuning;
    }
    
    public boolean isKeycapCustomization() {
        return keycapCustomization;
    }
    
    public void setKeycapCustomization(boolean keycapCustomization) {
        this.keycapCustomization = keycapCustomization;
    }
    
    public boolean isCableCustomization() {
        return cableCustomization;
    }
    
    public void setCableCustomization(boolean cableCustomization) {
        this.cableCustomization = cableCustomization;
    }
    
    public boolean isCaseModding() {
        return caseModding;
    }
    
    public void setCaseModding(boolean caseModding) {
        this.caseModding = caseModding;
    }
    
    public String getCustomNotes() {
        return customNotes;
    }
    
    public void setCustomNotes(String customNotes) {
        this.customNotes = customNotes;
    }
    
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
    
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public CustomOrderStatus getStatus() {
        return status;
    }
    
    public void setStatus(CustomOrderStatus status) {
        this.status = status;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    // Method để format createdAt cho JSP
    public String getFormattedCreatedAt() {
        if (createdAt == null) {
            return "";
        }
        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        return createdAt.format(formatter);
    }
} 