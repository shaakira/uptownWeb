package com.uptown.uptown.repository;

import com.uptown.uptown.entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AppointmentRepository extends JpaRepository<Appointment,Integer> {
    @Query("select appointment from Appointment appointment where  appointment.status='Pending' and appointment.property.user.Id=:advertiserId")
    List<Appointment> findPendingAppointments(@Param("advertiserId") Integer id);
    @Modifying
    @Query("UPDATE  Appointment  appointment SET  appointment.status='Accept' where appointment.id=:id")
    void acceptAppointment(@Param("id") Integer id);
    @Modifying
    @Query("UPDATE  Appointment  appointment SET  appointment.status='Reject' where appointment.id=:id")
    void rejectAppointment(@Param("id") Integer id);
    @Query("select appointment from Appointment appointment where  appointment.status='Accept' and appointment.property.user.Id=:advertiserId")
    List<Appointment> findAcceptAppointments(@Param("advertiserId") Integer id);
    @Modifying
    @Query("UPDATE  Appointment  appointment SET  appointment.status='Done' where appointment.id=:id")
    void completedAppointment(@Param("id") Integer id);
    @Query("select appointment from Appointment appointment where  appointment.status='Pending' and appointment.user.Id=:customerId")
    List<Appointment> findCustomerPendingAppointments(@Param("customerId") Integer id);
    @Query("select appointment from Appointment appointment where  appointment.status='Accept' and appointment.user.Id=:customerId")
    List<Appointment> findCustomerAcceptAppointments(@Param("customerId") Integer id);
    @Query("select appointment from Appointment appointment where  appointment.status='Reject' and appointment.user.Id=:customerId")
    List<Appointment> findCustomerRejectAppointments(@Param("customerId") Integer id);
    @Modifying
    @Query("UPDATE  Appointment  appointment SET  appointment.status='Cancel' where appointment.id=:id")
    void cancelAppointment(@Param("id") Integer id);
    @Query("select appointment from Appointment appointment where  appointment.status='Cancel' and appointment.user.Id=:customerId")
    List<Appointment> findCustomerCAncelAppointments(@Param("customerId") Integer id);
}
