package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }


    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User hau = this.userRepository.save(user);
        System.out.println(hau);
        return hau;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User deleteAUser(long id) {
        this.userRepository.deleteById(id);
        return null;
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    //mapper
    public User registerDTOtoUser(RegisterDTO registerDTO){
        User user = new User();

        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());    
        return user;
    }

    //check email có tồn tại hay không 
    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }

}
