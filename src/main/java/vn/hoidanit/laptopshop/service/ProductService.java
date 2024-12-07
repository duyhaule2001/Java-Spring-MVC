package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;


    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    // Lưu sản phẩm
    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);    
    }

    // Xóa sản phẩm
    public Product deleteProduct(long id) {
        this.productRepository.deleteById(id);   
        return null;
    }

    // Lấy sản phẩm theo ID
    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    // Thêm sản phẩm vào giỏ hàng
    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // Kiểm tra người dùng
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // Kiểm tra nếu người dùng đã có giỏ hàng
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Nếu chưa có giỏ hàng, tạo mới
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            // Lấy thông tin sản phẩm
            Product product = this.productRepository.findById(productId);

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);

            if (oldDetail == null) {
                // Nếu sản phẩm chưa có trong giỏ, thêm mới
                CartDetail newDetail = new CartDetail();
                newDetail.setCart(cart);
                newDetail.setProduct(product);
                newDetail.setPrice(product.getPrice());
                newDetail.setQuantity(1);
                this.cartDetailRepository.save(newDetail);

                // Cập nhật tổng số lượng sản phẩm trong giỏ
                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                this.cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                // Nếu sản phẩm đã có, tăng số lượng
                oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                this.cartDetailRepository.save(oldDetail);
            }
        }
    }

    public Cart fetchByUser(User user){
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session){
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if(cartDetailOptional.isPresent()){
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            //delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            //update cart
            if(currentCart.getSum() > 1){
                //update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            }else{
                //delete cart ( sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user,HttpSession session , String receiverName,String receiverAddress,String receiverPhone) {

        //create order detail

        //step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if(cart != null){
            List<CartDetail> cartDetails = cart.getCartDetails();

            if(cartDetails != null){

                //create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails){
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);


                for(CartDetail cd : cartDetails){
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }


                //step 2: delete cart_detail and cart
                for(CartDetail cd : cartDetails){
                    this.cartDetailRepository.deleteById(cd.getId());
                }

               this.cartRepository.deleteById(cart.getId());

               //step 3: update session
               session.setAttribute("sum", 0);
            }
        }
    }
}


