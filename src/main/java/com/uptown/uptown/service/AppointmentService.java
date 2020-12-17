package com.uptown.uptown.service;

import com.uptown.uptown.entity.Appointment;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.repository.AppointmentRepository;
import com.uptown.uptown.repository.PropertyRepository;
import com.uptown.uptown.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentRepository appointmentRepository;
    @Autowired
    private PropertyRepository propertyRepository;
    @Autowired
    private UserRepository userRepository;

    public String makeAppointment(Appointment appointment, Integer propId, Integer userId) {
        User customer = userRepository.findById(userId).orElse(null);
        Property property = propertyRepository.findById(propId).orElse(null);
        appointment.setUser(customer);
        appointment.setProperty(property);
        appointmentRepository.save(appointment);
        return "sent successfully";
    }


    public List<Appointment> getMyPendingAppointments(int id){
        return appointmentRepository.findPendingAppointments(id);
    }

    @Transactional
    public String acceptAppointment(int id){
        appointmentRepository.acceptAppointment(id);
        return "property accepted" +id;
    }
    @Transactional
    public String rejectAppointment(int id){
        appointmentRepository.rejectAppointment(id);
        return "property rejected" +id;
    }
    public List<Appointment> getMyAcceptedAppointments(int id){
        return appointmentRepository.findAcceptAppointments(id);
    }
    @Transactional
    public String completedAppointment(int id){
        appointmentRepository.completedAppointment(id);
        return "property rejected" +id;
    }

    public List<Appointment> findCustomerPendingAppointments(int id){
        return appointmentRepository.findCustomerPendingAppointments(id);
    }
    public List<Appointment> findCustomerAcceptAppointments(int id){
        return appointmentRepository.findCustomerAcceptAppointments(id);
    }
    public List<Appointment> findCustomerRejectAppointments(int id){
        return appointmentRepository.findCustomerRejectAppointments(id);
    }
    public String deleteAppointment(int id){
        appointmentRepository.deleteById(id);
        return "appointment removed " +id;
    }
    @Transactional
    public String cancelAppointment(int id){
        appointmentRepository.cancelAppointment(id);
        return "property rejected" +id;
    }
    public List<Appointment> findCustomerCancelAppointments(int id){
        return appointmentRepository.findCustomerCAncelAppointments(id);
    }

}
