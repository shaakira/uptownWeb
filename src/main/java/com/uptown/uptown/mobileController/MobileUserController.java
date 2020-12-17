package com.uptown.uptown.mobileController;

import com.uptown.uptown.dto.AdminDashboardDTO;
import com.uptown.uptown.dto.ClientCountDTO;
import com.uptown.uptown.dto.PasswordDTO;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.service.PropertyService;
import com.uptown.uptown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/user")
@RestController
public class MobileUserController {


    private UserService userService;
    private PropertyService propertyService;


    @Autowired
    public MobileUserController(UserService userService, PropertyService propertyService) {
        this.userService = userService;
        this.propertyService = propertyService;
    }

    @GetMapping("/profile/{id}")
    public User getUser(@PathVariable("id") int id) {
        User user = userService.getUserByUserId(id);
        return user;
    }

    @PostMapping("/updateUser/{id}")
    public String updateUser(@PathVariable("id") int id, @RequestBody User user) {
        userService.updateUser(user, id);
        return "Success";
    }

    @GetMapping(value = "/agents")
    public List<User> agentsGrid() {
        List<User> agents = userService.getAgentsList();
        return agents;
    }

    @GetMapping("/agentSingle/{id}")
    public List<Property> agentSingle(@PathVariable int id) {
        List<Property> properties = propertyService.getMyProperties(id);
        return properties;
    }

    @GetMapping(value = "/logout")
    public String logout() {
        SecurityContextHolder.getContext().setAuthentication(null);
        return "Success";
    }

    @GetMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable int userId) {
        userService.deleteUserById(userId);
        return "Success";
    }

    @PostMapping("/changePassword/{userId}")
    public String changePassword(@RequestBody PasswordDTO passwordDTO, @PathVariable int userId) {
        String status = userService.changePassword(passwordDTO.getEmail(), passwordDTO.getNewPassword(), passwordDTO.getConfirmPassword(), userId);
        return status;
    }

    @GetMapping("/clients")
    public ClientCountDTO getCount() {
        List<User> active = userService.getActiveUsers();
        int activeCount = active.size();
        List<User> blacklistedUsers = userService.getBlacklistedUsers();
        int blacklistedCount = blacklistedUsers.size();
        ClientCountDTO clientCountDTO = new ClientCountDTO();
        clientCountDTO.setActiveUserCount(activeCount);
        clientCountDTO.setBlacklistedUserCount(blacklistedCount);

        return clientCountDTO;
    }

    @GetMapping("/clients/active")
    public List<User> getActiveUsers() {
        List<User> activeUsers = userService.getActiveUsers();
        return activeUsers;
    }

    @GetMapping("/clients/blacklisted")
    public List<User> getBlacklistedUsers() {
        List<User> blacklistedUsers = userService.getBlacklistedUsers();
        return blacklistedUsers;
    }

    @GetMapping("/clients/blacklistUser/{userId}")
    public String blacklistUser(@PathVariable int userId) {
        userService.blacklistUser(userId);
        return "Success";
    }


    @GetMapping("/clients/activateUser/{userId}")
    public String ActivateUser(@PathVariable int userId) {
        userService.activateUser(userId);
        return "Success";
    }

    @GetMapping("/admin/dashboard")
    public AdminDashboardDTO getDashboard(){
        AdminDashboardDTO adminDashboardDTO=new AdminDashboardDTO();
        List<User> topAgents=userService.getTopAgentsList();
        adminDashboardDTO.setTopAgents(topAgents);
        int owners=userService.findOwners().size();
        int agents=userService.getAgentsList().size();
        int prop=propertyService.getPublishedProperty().size();
        int customers=userService.findCustomers().size();
        adminDashboardDTO.setAgentCount(agents);
        adminDashboardDTO.setCustomerCount(customers);
        adminDashboardDTO.setOwnerCount(owners);
        adminDashboardDTO.setPropCount(prop);
        return adminDashboardDTO;
    }



}
