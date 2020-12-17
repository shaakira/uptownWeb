package com.uptown.uptown;

import com.uptown.uptown.mail.Mail;
import com.uptown.uptown.mail.MailService;
import com.uptown.uptown.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import javax.mail.MessagingException;
import java.io.IOException;

@SpringBootApplication

public class UptownApplication {
    @Autowired

        public static void main(String[] args) {
            SpringApplication.run(UptownApplication.class, args);
        }


    }






