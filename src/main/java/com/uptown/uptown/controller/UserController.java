package com.uptown.uptown.controller;

import com.uptown.uptown.dto.UserDTO;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.service.PropertyService;
import com.uptown.uptown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PropertyService propertyService;

    @GetMapping("/customerPage")
    public ModelAndView getUser(HttpSession session, ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("customerPage");
        Object id = session.getAttribute("userId");
        User u = userService.getUserByUserId(Integer.parseInt(id.toString()));
        model.addAttribute("id", id);
        model.addAttribute("user", u);
        return modelAndView;
    }


    @PostMapping("/updateUser")
    public void updateUser(User user, HttpSession session) {
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        userService.updateUser(user, Id);
    }

    @PostMapping("/changePassword")
    public ModelAndView changePassword(String email, String newPassword, String confirmPassword, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("customerPage");
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        String status = userService.changePassword(email, newPassword, confirmPassword, Id);
        return modelAndView;


    }

    @GetMapping("/deleteUser")
    public String deleteUser(HttpSession session, SessionStatus sessionStatus) {
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        userService.deleteUserById(Id);
        SecurityContextHolder.getContext().setAuthentication(null);
        sessionStatus.setComplete();
        return "redirect:/home";

    }

    @GetMapping("/adminPage")
    public ModelAndView getAdmin(HttpSession session, ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("adminPage");
        Object id = session.getAttribute("userId");
        int propCount = userService.getPublishedProperty().size();
        model.addAttribute("propCount", propCount);
        int agentsCount = userService.getAgentsList().size();
        model.addAttribute("agentsCount", agentsCount);
        int userCount = userService.getUsersList().size();
        model.addAttribute("userCount", userCount);
        int advertiserCount = userService.getAdvertisers().size();
        model.addAttribute("advertiserCount", advertiserCount);
        User u = userService.getUserByUserId(Integer.parseInt(id.toString()));
        model.addAttribute("user", u);
        return modelAndView;
    }

    @GetMapping("/adminAbout")
    public ModelAndView getAdminDetails(HttpSession session, ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("adminAbout");
        Object id = session.getAttribute("userId");
        User u = userService.getUserByUserId(Integer.parseInt(id.toString()));
        model.addAttribute("user", u);
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/blacklistUser/{id}")
    public String blacklistUser(@PathVariable int id) {
        userService.blacklistUser(id);
        return "redirect:/clients";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/activateUser/{id}")
    public String ActivateUser(@PathVariable int id) {
        userService.activateUser(id);
        return "redirect:/clients";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/clients")
    public ModelAndView findAllUsers(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("clients");
        List<User> users = userService.getActiveUsers();
        model.addAttribute("users", users);
        List<User> blacklist = userService.getBlacklistedUsers();
        model.addAttribute("blacklisted", blacklist);
        return modelAndView;

    }

    @GetMapping(value = "/agents")
    public ModelAndView agentsGrid(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("agents");
        List<User> agents = userService.getAgentsList();
        model.addAttribute("agent", agents);
        return modelAndView;
    }

    @GetMapping("/agentSingle/{id}")
    public ModelAndView agentSingle(@PathVariable int id, ModelMap modelMap) {
        ModelAndView modelAndView = new ModelAndView("/agentSingle");
        User user = userService.getUserByUserId(id);
        modelMap.addAttribute("agent", user);
        List<Property> properties = propertyService.getMyProperties(id);
        modelMap.addAttribute("prop", properties);
        modelMap.addAttribute("propCount", properties.size());
        return modelAndView;
    }


}
