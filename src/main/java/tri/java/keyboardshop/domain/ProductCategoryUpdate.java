package tri.java.keyboardshop.domain;

import java.io.Serializable;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/**
 * Update the Product class to include category relationship
 */
@Entity
@Table(name = "products")
public class ProductCategoryUpdate implements Serializable {
    // This is just an example showing how to update the Product class
    // You should add this to your existing Product class

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    @Id
    private Long id;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}