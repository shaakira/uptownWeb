package com.uptown.uptown.controller;


import com.uptown.uptown.dto.UserDTO;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.request.AuthRequest;
import com.uptown.uptown.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@CrossOrigin(origins = "*")
@RequestMapping("/api/auth")
@Controller
public class AuthController {

    private AuthService authService;


    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/signUp")
    public String registerUser(@RequestParam("file") MultipartFile file,  User registerUser) {

        System.out.println("working register");
        System.out.println(registerUser.getUserName());
        System.out.println("user type"+registerUser.getuType());
        String aa= authService.registerUserService(registerUser,file);

        return "redirect:/home";
    }

    @PostMapping("/signIn")
    public ModelAndView loginUser(Model model, AuthRequest authRequest) {
        ModelAndView modelAndView=new ModelAndView();
        System.out.println(authRequest.getUserName());
        System.out.println(authRequest.getPassword());
        Boolean jwt= authService.loginUserServices(authRequest);
        if (jwt){
            modelAndView.setViewName("redirect:../../index");
        }
        else {
            modelAndView.setViewName("redirect:/signIn");
        }
        UserDetails userDetails=(UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name= userDetails.getUsername();
        System.out.println("name :"+name);
        System.out.println(jwt);
      //  System.out.println();

        return modelAndView;
    }
}
