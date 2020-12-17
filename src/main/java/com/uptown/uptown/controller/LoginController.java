package com.uptown.uptown.controller;


import com.uptown.uptown.entity.User;
import com.uptown.uptown.security.service.PdfUserDetails;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@SessionAttributes({"currentUser"})
@Controller
public class LoginController {
    //private static final Logger log = (Logger) LogManager.getLogger(LoginController.class);
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "signIn";
    }
    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginError(Model model) {
    //    log.info("Login attempt failed");
        model.addAttribute("error", "true");
        return "signIn";
    }
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(SessionStatus session) {
        SecurityContextHolder.getContext().setAuthentication(null);
        session.setComplete();
        return "redirect:/home";
    }
    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public ModelAndView postLogin(ModelMap model, HttpSession session, SessionStatus sessionStatus) {
        ModelAndView modelAndView=new ModelAndView();
      //  log.info("postLogin()");
        // read principal out of security context and set it to session
        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        validatePrinciple(authentication.getPrincipal());
        User loggedInUser = ((PdfUserDetails) authentication.getPrincipal()).getUserDetails();
        model.addAttribute("currentUser", loggedInUser.getUserName());
        model.addAttribute("user", loggedInUser);
//        model.addAttribute("currentUserId", loggedInUser.getId());
        session.setAttribute("userId", loggedInUser.getId());
       if(loggedInUser.getStatus().equals("active")){
           if(loggedInUser.getuType().equals("owner")|| loggedInUser.getuType().equals("agent")){
                    modelAndView.setViewName("redirect:/customerPage");
           }
           else if(loggedInUser.getuType().equals("admin")){
            modelAndView.setViewName("redirect:/adminPage");
           }
           else{
            modelAndView.setViewName("redirect:/home");
           }
       }
       else{
           SecurityContextHolder.getContext().setAuthentication(null);
           sessionStatus.setComplete();
           modelAndView.setViewName("redirect:/forbidden");
       }

            return modelAndView;
    }
    private void validatePrinciple(Object principal) {
        if (!(principal instanceof PdfUserDetails)) {
            throw new  IllegalArgumentException("Principal can not be null!");
        }
    }
}