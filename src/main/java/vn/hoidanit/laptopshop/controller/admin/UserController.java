package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUserByEmail("duyhaule2001@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("hau", "test");
        model.addAttribute("leduyhau", "form controller");
        return "leduyhau";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User userInfor = this.userService.getUserById(id);
        model.addAttribute("userInfor", userInfor);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }


    //create user
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User leduyhau,
            BindingResult bindingResult,
            @RequestParam("leduyhauFile") MultipartFile file
           ) {
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors ) {
             System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
            }
        //validate
        

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(leduyhau.getPassword());

        leduyhau.setAvatar(avatar);
        leduyhau.setPassword(hashPassword);
        leduyhau.setRole(this.userService.getRoleByName(leduyhau.getRole().getName()));
        // save
        this.userService.handleSaveUser(leduyhau);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User leduyhau) {
        User currentUser = this.userService.getUserById(leduyhau.getId());
        if (currentUser != null) {
            currentUser.setAddress(leduyhau.getAddress());
            currentUser.setPhone(leduyhau.getPhone());
            currentUser.setFullName(leduyhau.getFullName());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getMethodName(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User leduyhau) {
        this.userService.deleteAUser(leduyhau.getId());
        return "redirect:/admin/user";
    }

}
