package com.uptown.uptown.service;

import com.uptown.uptown.dto.UserDTO;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.repository.PropertyRepository;
import com.uptown.uptown.repository.UserRepository;
import com.uptown.uptown.response.MessageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private PropertyRepository propertyRepository;

    @Autowired
    public UserService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.userRepository = userRepository;
    }

    public User getUserByUserId(Integer Id) {
        User user = userRepository.findById(Id).get();
        UserDTO userDTO = new UserDTO(user.getId(),
                user.getUserName(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getAddress(), user.getPassword(),
                user.getuType(), user.getImage(), user.getStatus());

        return user;
    }

    public String deleteUserById(Integer id) {
        User user = userRepository.findById(id).orElse(null);
        userRepository.deleteById(user.getId());
        return "user removed " + user.getFirstName();
    }

    public void updateUser(User user, Integer id) {
        User existingUser = userRepository.findById(id).orElse(null);
        existingUser.setFirstName(user.getFirstName());
        existingUser.setLastName(user.getLastName());
        existingUser.setEmail(user.getEmail());
        existingUser.setAddress(user.getAddress());
        userRepository.save(existingUser);
    }


    public String changePassword(String email, String newPassword, String confirmPassword, Integer id) {
        String status;
        User existingUser = userRepository.findById(id).orElse(null);
        if (email.equals(existingUser.getEmail())) {
            if (newPassword.equals(confirmPassword)) {
                existingUser.setPassword(bCryptPasswordEncoder.encode(newPassword));
                userRepository.save(existingUser);
                status = "password successfully updated";
            } else {
                status = "password mismatch !!";

            }
        } else {
            status = "invalid email";
        }
        System.out.println(status);
        return status;

    }

    @Transactional
    public String blacklistUser(int id) {
        userRepository.blacklist(id);
        return "user blacklisted " + id;
    }

    public List<User> getActiveUsers() {
        return userRepository.findActiveUsers();
    }

    public List<User> getBlacklistedUsers() {
        return userRepository.findBlacklistUsers();
    }

    @Transactional
    public String activateUser(int id) {
        userRepository.activate(id);
        return "user blacklisted " + id;
    }

    public List<Property> getPublishedProperty() {
        return propertyRepository.findPublishedProperty();
    }

    public List<User> getAdvertisers() {
        return userRepository.findAdvertisers();
    }

    public List<User> getUsersList() {
        return userRepository.findUsers();
    }

    public List<User> getAgentsList() {
        return userRepository.findAgents();
    }

    public List<User> getTopAgentsList() {
        List<User> agents = userRepository.findAgents();
        List<User> top = new ArrayList<>();
        top.add(agents.get(0));
        top.add(agents.get(1));
        top.add(agents.get(2));
        return top;
    }

    public List<User> findOwners() {
        List<User> owners = userRepository.findOwners();
        return owners;
    }

    public List<User> findCustomers() {
        List<User> customers = userRepository.findCustomers();
        return customers;
    }
}
