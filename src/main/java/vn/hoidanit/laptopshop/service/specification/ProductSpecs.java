package vn.hoidanit.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name){
    return (root, query, criteriaBuilder) 
      -> criteriaBuilder.like(root.get(Product_.NAME), "%"+name+"%");
    }

    //min-price
    public static Specification<Product> minPrice(double minPrice) {
      return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), minPrice);
    }

    //max-price
    public static Specification<Product> maxPrice(double maxPrice) {
      return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), maxPrice);
    }

      //factory
    public static Specification<Product> matchFactory(List<String> factory) {
      return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }


    //case5
    public static Specification<Product> matchPrice(double min, double max) {
      return (root, query, criteriaBuilder) -> criteriaBuilder.and(
        criteriaBuilder.gt(root.get(Product_.PRICE), min),
        criteriaBuilder.le(root.get(Product_.PRICE), max)
      );
    }

     // case6
     public static Specification<Product> matchMultiplePrice(double min, double max) {
      return (root, query, criteriaBuilder) -> criteriaBuilder.between(
              root.get(Product_.PRICE), min, max);
  }
}
