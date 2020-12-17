package com.uptown.uptown.mobileController;

import com.uptown.uptown.entity.Appointment;
import com.uptown.uptown.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/appointment")
@RestController
public class MobileAppointmentController {

    private AppointmentService appointmentService;

    @Autowired
    public MobileAppointmentController(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    @PostMapping("/makeAppointment/{propId}/{userId}")
    public String makeAppointment(@RequestBody Appointment appointment, @PathVariable int propId,@PathVariable int userId){
        appointmentService.makeAppointment(appointment,propId,userId);
        return "Success";
    }

    @GetMapping("customerAppointments/pending/{customerId}")
    public List<Appointment> customerPendingAppointment(@PathVariable int customerId){
        List<Appointment> pendingAppointments = appointmentService.findCustomerPendingAppointments(customerId);
        return  pendingAppointments;
    }
    @GetMapping("customerAppointments/accepted/{customerId}")
    public List<Appointment> customerAcceptedAppointment(@PathVariable int customerId){
        List<Appointment> acceptedAppointments = appointmentService.findCustomerAcceptAppointments(customerId);
        return  acceptedAppointments;
    }

    @GetMapping("customerAppointments/deleteAppointment/{appointmentId}")
    public String deleteAppointment(@PathVariable int appointmentId) {
        appointmentService.deleteAppointment(appointmentId);
        return "Success";
    }
    @GetMapping("/advertiserAppointment/pending/{advertiserId}")
    public List<Appointment> findPendingAppointments(@PathVariable int advertiserId) {
        List<Appointment> pendingAppointments = appointmentService.getMyPendingAppointments(advertiserId);
        return pendingAppointments;
    }

    @GetMapping("/advertiserAppointment/accepted/{advertiserId}")
    public List<Appointment> findUpcomingAppointments(@PathVariable int advertiserId) {
        List<Appointment> acceptedAppointments = appointmentService.getMyAcceptedAppointments(advertiserId);
        return acceptedAppointments;
    }


    @GetMapping("/acceptAppointment/{id}")
    public String acceptAppointment(@PathVariable int id) {
        appointmentService.acceptAppointment(id);
        return "Success";
    }

    @GetMapping("/rejectAppointment/{id}")
    public String rejectAppointment(@PathVariable int id) {
        appointmentService.rejectAppointment(id);
        return "Success";
    }
    @GetMapping("/completedAppointment/{id}")
    public String completedAppointment(@PathVariable int id) {
        appointmentService.deleteAppointment(id);
        return "Success";
    }
    @GetMapping("/cancelAppointment/{id}")
    public String cancelAppointment(@PathVariable int id) {
        appointmentService.cancelAppointment(id);
        return "Success";
    }
}
