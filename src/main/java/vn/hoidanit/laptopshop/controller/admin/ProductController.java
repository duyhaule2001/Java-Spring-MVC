package vn.hoidanit.laptopshop.controller.admin;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

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


    //delete page
     @GetMapping("/admin/product/delete/{id}")
    public String getMethodName(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }

    //update
    @GetMapping("/admin/product/update/{id}")
    public String updateProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
          model.addAttribute("newProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("newProduct") @Valid Product product , BindingResult newProductBindingResult, @RequestParam("productFile") MultipartFile file) {
       Product currentProduct = this.productService.getProductById(product.getId());

       //validate
       if(newProductBindingResult.hasErrors()){
        return "/admin/product/create";
    }
       if(currentProduct != null) {
        currentProduct.setName(product.getName());
        currentProduct.setPrice(product.getPrice());
        currentProduct.setDetailDesc(product.getDetailDesc());
        currentProduct.setShortDesc(product.getShortDesc());
        currentProduct.setQuantity(product.getQuantity());
        currentProduct.setFactory(product.getFactory());
        currentProduct.setTarget(product.getTarget());
        if(!file.isEmpty()){
            String productImage = this.uploadService.handleSaveUploadFile(file, "product");
            currentProduct.setImage(productImage);
        }
        this.productService.handleSaveProduct(currentProduct);
       }
        return "redirect:/admin/product";
    }

    //詳細情報
    @GetMapping("/admin/product/{id}")
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product productInfo = this.productService.getProductById(id);
        model.addAttribute("productInfo", productInfo);
        return "admin/product/detail";
    }
}
