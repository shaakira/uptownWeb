package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.service.EmailService;
import com.uptown.uptown.service.PropertyService;
import com.uptown.uptown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private PropertyService propertyService;

    @Autowired
    private EmailService emailService;

@GetMapping(value = "/home")
    public String index(ModelMap model){
    List<User> agents=userService.getTopAgentsList();
    model.addAttribute("agent",agents);
    List<Property> properties=propertyService.getLatestProperty();
   model.addAttribute("prop",properties);
    return "home";
    }

    @GetMapping(value = "/signIn")
    public String signIn(){
        return "signIn";
    }
    @GetMapping(value = "/signUp")
    public String signUp(){
        return "signUp";
    }

    @GetMapping(value = "/upload")
    public String upload(){
        return "upload";
    }


    @GetMapping(value = "/contact")
    public String Contact(){

        return "contact";
    }
    @GetMapping(value = "/addProperty")
    public String AddProperty(Model model){

        if(!isLogged()){
            return "signIn";
        }

    return "addProperty";
    }
    @GetMapping(value = "/changePassword")
    public ModelAndView ChangePassword(HttpSession session, ModelMap modelMap){
        ModelAndView modelAndView = new ModelAndView("changePassword");
        Object id = session.getAttribute("userId");
        User u = userService.getUserByUserId(Integer.parseInt(id.toString()));
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("user", u);
        return modelAndView;
    }

    @GetMapping(value = "/deleteAccount")
    public ModelAndView DeleteAccount(HttpSession session,ModelMap modelMap){
        ModelAndView modelAndView = new ModelAndView("deleteAccount");
        Object id = session.getAttribute("userId");
        User u = userService.getUserByUserId(Integer.parseInt(id.toString()));
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("user", u);
        return modelAndView;
    }

    public static boolean isLogged() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return null != authentication && !("anonymousUser").equals(authentication.getName());
    }

    @RequestMapping(value = "/sendemail")
    public String sendEmail() throws AddressException, MessagingException, IOException {
        emailService.sendmails();
        return "Email sent successfully";
    }
    @GetMapping(value = "/propList")
    public String PropertyList(){
        return "propertyList";
    }

    @GetMapping(value = "/forbidden")
    public String AccessDenied(){
        return "forbidden";
    }


}
