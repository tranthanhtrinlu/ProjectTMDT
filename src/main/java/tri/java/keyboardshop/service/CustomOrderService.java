package tri.java.keyboardshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.*;
import tri.java.keyboardshop.repository.CustomOrderRepository;
import tri.java.keyboardshop.repository.CustomServiceRepository;
import tri.java.keyboardshop.repository.ProductRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class CustomOrderService {
    
    @Autowired
    private CustomOrderRepository customOrderRepository;
    
    @Autowired
    private CustomServiceRepository customServiceRepository;
    
    @Autowired
    private ProductRepository productRepository;
    
    // Service prices (có thể lưu trong database hoặc config)
    private static final BigDecimal LUBING_SERVICE_PRICE = new BigDecimal("75000");
    private static final BigDecimal STABILIZER_TUNING_PRICE = new BigDecimal("40000");
    private static final BigDecimal KEYCAP_CUSTOMIZATION_PRICE = new BigDecimal("150000");
    private static final BigDecimal CABLE_CUSTOMIZATION_PRICE = new BigDecimal("225000");
    private static final BigDecimal CASE_MODDING_PRICE = new BigDecimal("350000");
    
    public CustomOrder createCustomOrder(User user, Product baseKeyboard) {
        CustomOrder customOrder = new CustomOrder(user, baseKeyboard);
        return customOrderRepository.save(customOrder);
    }
    
    public CustomOrder updateCustomOrder(CustomOrder customOrder) {
        calculateTotalPrice(customOrder);
        return customOrderRepository.save(customOrder);
    }
    
    public Optional<CustomOrder> findById(Long id) {
        return customOrderRepository.findById(id);
    }
    
    public List<CustomOrder> findByUser(User user) {
        return customOrderRepository.findByUserOrderByCreatedAtDesc(user);
    }
    
    public List<CustomOrder> findByUserId(Long userId) {
        return customOrderRepository.findByUserIdOrderByCreatedAtDesc(userId);
    }
    
    public List<CustomOrder> findAllOrders() {
        return customOrderRepository.findAll();
    }
    
    public void calculateTotalPrice(CustomOrder customOrder) {
        BigDecimal total = BigDecimal.valueOf(customOrder.getBaseKeyboard().getPrice());
        
        // Add keycap price
        if (customOrder.getSelectedKeycap() != null) {
            total = total.add(BigDecimal.valueOf(customOrder.getSelectedKeycap().getPrice()));
        }
        
        // Add kit price
        if (customOrder.getSelectedKit() != null) {
            total = total.add(BigDecimal.valueOf(customOrder.getSelectedKit().getPrice()));
        }
        
        // Add service prices
        if (customOrder.isLubingService()) {
            total = total.add(LUBING_SERVICE_PRICE);
        }
        
        if (customOrder.isStabilizerTuning()) {
            total = total.add(STABILIZER_TUNING_PRICE);
        }
        
        if (customOrder.isKeycapCustomization()) {
            total = total.add(KEYCAP_CUSTOMIZATION_PRICE);
        }
        
        if (customOrder.isCableCustomization()) {
            total = total.add(CABLE_CUSTOMIZATION_PRICE);
        }
        
        if (customOrder.isCaseModding()) {
            total = total.add(CASE_MODDING_PRICE);
        }
        
        customOrder.setTotalPrice(total);
    }
    
    public List<Product> getAvailableKeycaps() {
        return productRepository.findByType(Product.ProductType.KEYCAP);
    }
    
    public List<Product> getAvailableKits() {
        return productRepository.findByType(Product.ProductType.KIT);
    }
    
    public List<Product> getAvailableSwitches() {
        return productRepository.findByType(Product.ProductType.SWITCH);
    }
    
    public BigDecimal getServicePrice(String serviceName) {
        switch (serviceName.toLowerCase()) {
            case "lubing":
                return LUBING_SERVICE_PRICE;
            case "stabilizer":
                return STABILIZER_TUNING_PRICE;
            case "keycap_custom":
                return KEYCAP_CUSTOMIZATION_PRICE;
            case "cable":
                return CABLE_CUSTOMIZATION_PRICE;
            case "case":
                return CASE_MODDING_PRICE;
            default:
                return BigDecimal.ZERO;
        }
    }
    
    public void deleteCustomOrder(Long id) {
        customOrderRepository.deleteById(id);
    }
} 