package tri.java.keyboardshop.domain;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "order_discounts")
public class OrderDiscount implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Min(value = 0, message = "Giá trị giảm giá không được âm")
    private double discountAmount;

    // order_id
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // discount_code_id
    @ManyToOne
    @JoinColumn(name = "discount_code_id")
    private DiscountCode discountCode;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public DiscountCode getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(DiscountCode discountCode) {
        this.discountCode = discountCode;
    }

    @Override
    public String toString() {
        return "OrderDiscount [id=" + id + ", discountAmount=" + discountAmount + "]";
    }
}