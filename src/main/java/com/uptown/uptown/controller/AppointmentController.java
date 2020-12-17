package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Appointment;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.service.AppointmentService;
import com.uptown.uptown.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

//@RestController
@Controller
public class AppointmentController {

    @Autowired
    private AppointmentService service;

    @PostMapping("/makeAppointment/{propId}")
    public String makeAppointment(Appointment appointment, @PathVariable int propId, HttpSession session){
        Object id = session.getAttribute("userId");
        Integer userId = Integer.parseInt(id.toString());
        service.makeAppointment(appointment,propId,userId);
        return "redirect:/singleProperty/{propId}";
    }
    @GetMapping("/appointment")
    public ModelAndView findMyAppoinments(ModelMap model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("appointment");
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        List<Appointment> pendingAppointments = service.getMyPendingAppointments(Id);
        model.addAttribute("pending", pendingAppointments);
        List<Appointment> acceptedAppointments = service.getMyAcceptedAppointments(Id);
        model.addAttribute("accept", acceptedAppointments);
        return modelAndView;
    }
    @PreAuthorize("hasRole('ROLE_AGENT')||hasRole('ROLE_OWNER')")
    @GetMapping("/acceptAppointment/{id}")
    public String acceptAppointment(@PathVariable int id) {
        service.acceptAppointment(id);
        return "redirect:/appointment";
    }

    @PreAuthorize("hasRole('ROLE_AGENT')||hasRole('ROLE_OWNER')")
    @GetMapping("/rejectAppointment/{id}")
    public String rejectAppointment(@PathVariable int id) {
        service.rejectAppointment(id);
        return "redirect:/appointment";
    }
    @PreAuthorize("hasRole('ROLE_AGENT')||hasRole('ROLE_OWNER')")
    @GetMapping("/completedAppointment/{id}")
    public String completedAppointment(@PathVariable int id) {
        service.deleteAppointment(id);
        return "redirect:/appointment";
    }
    @PreAuthorize("hasRole('ROLE_AGENT')||hasRole('ROLE_OWNER')")
    @GetMapping("/cancelAppointment/{id}")
    public String cancelAppointment(@PathVariable int id) {
        service.cancelAppointment(id);
        return "redirect:/appointment";
    }
    @GetMapping("/customerAppointment")
    public ModelAndView findCustomerAppointment(ModelMap model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("customerAppointment");
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        List<Appointment> pendingAppointments = service.findCustomerPendingAppointments(Id);
        model.addAttribute("penCount",pendingAppointments.size());
        List<Appointment> acceptedAppointments = service.findCustomerAcceptAppointments(Id);
        model.addAttribute("accept",acceptedAppointments);
        model.addAttribute("accCount",acceptedAppointments.size());
        List<Appointment> rejectedAppointments = service.findCustomerRejectAppointments(Id);
        model.addAttribute("rejCount",rejectedAppointments.size());
        List<Appointment> cancelledAppointments = service.findCustomerCancelAppointments(Id);
        model.addAttribute("cancel",cancelledAppointments);
        List<Appointment> appointments=new ArrayList<>();
        appointments.addAll(pendingAppointments);
        appointments.addAll(acceptedAppointments);
        appointments.addAll(rejectedAppointments);
        model.addAttribute("all",appointments);
        model.addAttribute("allCount",appointments.size());


        return modelAndView;
    }
    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @GetMapping("/deleteAppointment/{id}")
    public String deleteAppointment(@PathVariable int id) {
        service.deleteAppointment(id);
        return "redirect:/customerAppointment";
    }

}
