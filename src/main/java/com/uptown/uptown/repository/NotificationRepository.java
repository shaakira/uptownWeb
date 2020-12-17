package com.uptown.uptown.repository;

import com.uptown.uptown.entity.Notifications;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationRepository extends JpaRepository<Notifications,Integer> {
}
