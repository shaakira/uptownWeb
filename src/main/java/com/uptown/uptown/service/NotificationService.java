package com.uptown.uptown.service;

import com.uptown.uptown.entity.Notifications;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.repository.NotificationRepository;
import com.uptown.uptown.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService  {

    @Autowired
    private NotificationRepository repository;
    @Autowired
    private UserRepository userRepository;

    public String saveNotification(Notifications notification,Integer Id ){
        User admin=userRepository.findById(Id).orElse(null);
        notification.setUser(admin);
        repository.save(notification);
        return "sent successfully";
    }

    public List<Notifications> getNotificationList(){
        return  repository.findAll();
    }

    public String deleteNotification(int id){
        repository.deleteById(id);
        return "notification removed " +id;
    }
}
