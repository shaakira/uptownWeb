package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Enquiry;
import com.uptown.uptown.service.EnquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

//@RestController
@Controller
public class EnquiryController {

    @Autowired
    private EnquiryService service;

    @PostMapping("/addEnquiry/{id}")
    public String addEnquiry(Enquiry enquiry, @PathVariable int id) {
        service.saveEnquiry(enquiry, id);
        return "redirect:/singleProperty/{id}";
    }



    @GetMapping("/enquiries")
    public ModelAndView findAllEnquiries(HttpSession session, ModelMap modelMap) {
        ModelAndView modelAndView=new ModelAndView("enquiries");
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        List<Enquiry> enquiries=service.getEnquiryList(Id);
        modelMap.addAttribute("enquiry",enquiries);
        return modelAndView;
    }

    @GetMapping("/deleteEnquiry/{id}")
    public String deleteEnquiry(@PathVariable int id) {
         service.deleteEnquiry(id);
         return "redirect:/enquiries";
    }
}
