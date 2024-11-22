package vn.hoidanit.laptopshop.controller.admin;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;


@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;


    public ProductController(UploadService uploadService,ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }


    //リスト表示
    @RequestMapping("/admin/product")
    public String getListProduct(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

 
    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model){
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }


    //create product
    @PostMapping("/admin/product/create")
    public String postMethodName(Model model, @ModelAttribute("newProduct")
        @Valid Product product,
        BindingResult newProductBindingResult,
        @RequestParam("productFile") MultipartFile file) {

        //validate
        if(newProductBindingResult.hasErrors()){
            return "/admin/product/create";
        }


        String productImage = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(productImage);
        this.productService.handleSaveProduct(product);

        return "redirect:/admin/product";
    }
    
}
