package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Notifications;
import com.uptown.uptown.mail.Mail;
import com.uptown.uptown.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;
import java.io.IOException;

@RestController
public class EmailController {

    @Autowired
    EmailService emailService;

    @GetMapping("/sendEmail")
    public void sendMail(@RequestBody Notifications mail) throws IOException, MessagingException {
         emailService.sendmails();
    }
}
