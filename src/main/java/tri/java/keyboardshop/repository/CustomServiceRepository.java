package tri.java.keyboardshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tri.java.keyboardshop.domain.CustomService;

import java.util.List;

@Repository
public interface CustomServiceRepository extends JpaRepository<CustomService, Long> {
    
    List<CustomService> findByIsActiveTrue();
} 