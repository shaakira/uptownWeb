package com.uptown.uptown.repository;

import com.uptown.uptown.entity.Enquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EnquiryRepository extends JpaRepository<Enquiry,Integer> {

    @Query("select enquiry from Enquiry enquiry where  enquiry.property.user.Id=:userId")
    List<Enquiry> findAllEnquiry(@Param("userId") Integer id);
}
