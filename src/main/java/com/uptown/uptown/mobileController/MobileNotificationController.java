package com.uptown.uptown.mobileController;

import com.uptown.uptown.entity.Notifications;
import com.uptown.uptown.mail.Mail;
import com.uptown.uptown.mail.MailService;
import com.uptown.uptown.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/notification")
@RestController
public class MobileNotificationController {

    private NotificationService notificationService;
    private MailService mailService;

    @Autowired
    public MobileNotificationController(NotificationService notificationService ,MailService mailService) {
        this.notificationService = notificationService;
        this.mailService=mailService;
    }
    @PostMapping("/addNotification")
    public String addNotification(@RequestBody Notifications notification){
        notificationService.saveNotification(notification,18);
//        Mail mail=new Mail();
//        mail.setMailContent(notification.getMessage());
//        mail.setMailFrom(notification.getEmail());
//        mail.setMailSubject(notification.getSubject());
//        mailService.sendEmail(mail);
        return "Success";
    }
    @GetMapping("/notificationList")
    public List<Notifications> findAllNotifications(){
        List<Notifications> notifications=notificationService.getNotificationList();
        return notifications;
    }

    @GetMapping("/deleteNotification/{id}")
    public  String deleteNotification(@PathVariable int id){
        notificationService.deleteNotification(id);
        return "Success";
    }
}
