package tri.java.keyboardshop.domain.dto;

import java.util.List;
import java.util.Optional;
import tri.java.keyboardshop.domain.Product.ProductType;

public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> factory;
    private Optional<List<String>> target;
    private Optional<List<String>> price;
    private Optional<List<String>> type;
    private Optional<String> sort;

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<List<String>> getFactory() {
        return factory;
    }

    public void setFactory(Optional<List<String>> factory) {
        this.factory = factory;
    }

    public Optional<List<String>> getTarget() {
        return target;
    }

    public void setTarget(Optional<List<String>> target) {
        this.target = target;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<List<String>> getType() {
        return type;
    }

    public void setType(Optional<List<String>> type) {
        this.type = type;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "ProductCriteriaDTO{" +
                "page=" + page +
                ", factory=" + factory +
                ", target=" + target +
                ", price=" + price +
                ", type=" + type +
                ", sort=" + sort +
                '}';
    }

}
