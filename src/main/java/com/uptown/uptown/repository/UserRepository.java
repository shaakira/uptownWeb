package com.uptown.uptown.repository;

import com.uptown.uptown.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
    User findByUserName(String username);
    boolean existsByUserName(String username);
    boolean existsByEmail(String email);
    @Query("select user from User user where user.uType='agent' and user.status='active'")
    List<User> findAgents();
    @Modifying
    @Query("UPDATE  User  user SET  user.status='blacklist' where user.Id=:userId")
    void blacklist(@Param("userId") Integer id);
    @Query("select user from User user where not  user.uType='admin' and user.status='active'")
    List<User> findActiveUsers();
    @Query("select user from User user where not  user.uType='admin' and user.status='blacklist'")
    List<User> findBlacklistUsers();
    @Modifying
    @Query("UPDATE  User  user SET  user.status='active' where user.Id=:userId")
    void activate(@Param("userId") Integer id);
    @Query("select user from User user where user.uType='agent' or user.uType='owner' and user.status='active'")
    List<User> findAdvertisers();
    @Query("select user from User user where not user.uType='admin' ")
    List<User> findUsers();
    @Query("select user from User user where user.uType='owner' and user.status='active'")
    List<User> findOwners();
    @Query("select user from User user where user.uType='customer' and user.status='active'")
    List<User> findCustomers();

}
