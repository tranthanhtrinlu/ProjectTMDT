package tri.java.keyboardshop.service;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tri.java.keyboardshop.domain.Order;
import tri.java.keyboardshop.domain.Order.OrderStatus;
import tri.java.keyboardshop.domain.OrderDetail;
import tri.java.keyboardshop.domain.User;
import tri.java.keyboardshop.repository.OrderDetailRepository;
import tri.java.keyboardshop.repository.OrderRepository;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> fetchAllOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        // Delete order details
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Transactional
    public void cancelOrder(Long orderId, User user) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Đơn hàng không tồn tại"));
        if (order.getUser().getId() != user.getId()) { // Sửa từ equals() thành ==
            throw new IllegalStateException("Bạn không có quyền hủy đơn hàng này");
        }
        if (!OrderStatus.PENDING.equals(order.getStatus())) {
            throw new IllegalStateException("Chỉ có thể hủy đơn hàng ở trạng thái PENDING");
        }
        order.setStatus(OrderStatus.CANCEL);
        orderRepository.save(order);
    }

    @Transactional
    public void confirmOrder(Long orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Đơn hàng không tồn tại"));
        if (order.getStatus() != OrderStatus.PENDING) {
            throw new IllegalStateException("Chỉ có thể xác nhận đơn hàng ở trạng thái PENDING");
        }
        order.setStatus(OrderStatus.COMPLETE); // Giả định xác nhận là hoàn thành
        orderRepository.save(order);
    }

    public boolean hasUserPurchased(Long userId, Long productId) {
        return orderRepository.existsByUserIdAndProductIdAndStatus(userId, productId, OrderStatus.COMPLETE);
    }
}