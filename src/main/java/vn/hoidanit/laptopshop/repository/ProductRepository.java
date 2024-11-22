package vn.hoidanit.laptopshop.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // void deleteById(long id);

    // List<User> findOneByEmail(String email);

    // List<User> findAll();

    // User findById(long id);
}
