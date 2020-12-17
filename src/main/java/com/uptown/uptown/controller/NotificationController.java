package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Notifications;
import com.uptown.uptown.mail.Mail;
import com.uptown.uptown.mail.MailService;
import com.uptown.uptown.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

//@RestController
@Controller
public class NotificationController {

    @Autowired
    private MailService mailService;

    @Autowired
    private NotificationService service;

    @PostMapping("/addNotification")
    public String addNotification( Notifications notification){
        service.saveNotification(notification,18);
        Mail mail=new Mail();
        mail.setMailContent(notification.getMessage());
        mail.setMailFrom(notification.getEmail());
        mail.setMailSubject(notification.getSubject());
        mailService.sendEmail(mail);
        return "redirect:/contact";

    }

    @GetMapping("/contacts")
    public ModelAndView findAllNotifications(ModelMap model){
        ModelAndView modelAndView=new ModelAndView("contacts");
        List<Notifications> notifications=service.getNotificationList();
        model.addAttribute("notifications",notifications);
        return modelAndView;
    }

    @GetMapping("/deleteNotification/{id}")
    public  String deleteNotification(@PathVariable int id){
         service.deleteNotification(id);
        return "redirect:/contacts";
    }
}
