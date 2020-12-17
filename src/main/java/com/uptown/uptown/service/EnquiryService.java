package com.uptown.uptown.service;

import com.uptown.uptown.entity.Enquiry;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.repository.EnquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnquiryService {

    @Autowired
    private EnquiryRepository repository;
    @Autowired
    private PropertyService propertyService;

    public String saveEnquiry(Enquiry enquiry,int id){
            Property property=propertyService.getPropertyById(id);
            enquiry.setProperty(property);
            repository.save(enquiry);

        return "sent successfully";
    }


    public List<Enquiry> getEnquiryList(int id){
        return  repository.findAllEnquiry(id);
    }

    public String deleteEnquiry(int id){
        repository.deleteById(id);
        return "enquiry removed " +id;
    }
    public Enquiry getEnquiryById(int id) {
        Enquiry enquiry = repository.findById(id).orElse(null);
        return enquiry;
    }
}
