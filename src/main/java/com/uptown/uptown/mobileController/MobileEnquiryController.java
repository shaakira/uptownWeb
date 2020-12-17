package com.uptown.uptown.mobileController;


import com.uptown.uptown.entity.Appointment;
import com.uptown.uptown.entity.Enquiry;
import com.uptown.uptown.service.EnquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/enquiry")
@RestController
public class MobileEnquiryController {

    EnquiryService enquiryService;

    @Autowired
    public MobileEnquiryController(EnquiryService enquiryService) {
        this.enquiryService = enquiryService;
    }


    @PostMapping("/addEnquiry/{id}")
    public String addEnquiry(@PathVariable int id, @RequestBody Enquiry enquiry) {
        enquiryService.saveEnquiry(enquiry, id);
        return "Success";
    }

    @GetMapping("/findAll/{advertiserId}")
    public List<Enquiry> findAllEnquiries(@PathVariable int advertiserId) {
        List<Enquiry> enquiries = enquiryService.getEnquiryList(advertiserId);
        return enquiries;
    }

    @GetMapping("/deleteEnquiry/{enquiryId}")
    public String deleteEnquiry(@PathVariable int enquiryId) {
        enquiryService.deleteEnquiry(enquiryId);

        return "Success";

    }
    @GetMapping("/getEnquiry/{id}")
    public Enquiry getEnquiryById(@PathVariable int id){
        Enquiry enquiry=enquiryService.getEnquiryById(id);
        return  enquiry;
    }



}
