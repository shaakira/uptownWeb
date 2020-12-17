package com.uptown.uptown.repository;


import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PropertyRepository extends JpaRepository<Property,Integer> {
    @Modifying
    @Query("UPDATE  Property  property SET  property.status='Accept' where property.id=:propId")
    void acceptProperty(@Param("propId") Integer id);
    @Modifying
    @Query("UPDATE  Property  property SET  property.status='Reject' where property.id=:propId")
    void rejectProperty(@Param("propId") Integer id);
    @Query("select property from Property property where  property.status='Accept'")
    List<Property> findPublishedProperty();
    @Query("select property from Property property where  property.status='Pending'")
    List<Property> findPendingProperty();
    @Query("select property from Property property where  property.status='Accept' and property.user.Id=:userId")
    List<Property> findMyProperty(@Param("userId") Integer id);
    @Query("select property from Property property where  property.status='Pending' and property.user.Id=:userId")
    List<Property> findRequest(@Param("userId") Integer id);
    @Query("select property from Property property where  property.status='Reject' and property.user.Id=:userId")
    List<Property> findMyRejectedProp(@Param("userId") Integer id);
    @Modifying
    @Query("UPDATE  Property  property SET  property.status='Pending' where property.id=:propId")
    void requestAgain(@Param("propId") Integer id);
    @Modifying
    @Query("DELETE FROM Property  property where property.id=:propId and property.user.Id=:userId")
    void deleteUserProperty(@Param("propId") Integer id,@Param("userId") Integer uId);
    @Query("select property from Property property where  property.status='Accept' ORDER BY property.id DESC")
    List<Property> findLatestProperty();
    @Query("select property from Property property where  property.status='Accept' and property.id=:propId")
    Optional<Property> getSingleProperty(@Param("propId") Integer id);
    @Query("select property from Property property where property.status='Accept' and property.heading=:heading and property.city=:city and property.pType=:pType and property.baths=:baths and property.rooms=:rooms and property.garage=:garage")
    List<Property> searchWithHeading(@Param("heading") String heading,@Param("city") String city,@Param("pType") String pType,@Param("baths") Integer baths,@Param("rooms") Integer rooms,@Param("garage") Integer garage);
    @Query("select property from Property property where property.status='Accept' and property.city=:city and property.pType=:pType and property.baths=:baths and property.rooms=:rooms and property.garage=:garage")
    List<Property> searchWithoutHeading(@Param("city") String city,@Param("pType") String pType,@Param("baths") Integer baths,@Param("rooms") Integer rooms,@Param("garage") Integer garage);
    @Query("select property from Property property where  property.status='Accept' and property.city=:city")
    List<Property> searchCity(@Param("city") String city);
    @Query("select property from Property property where  property.status='Pending' and property.id=:propId")
    Optional<Property> getSinglePendingProperty(@Param("propId") Integer id);
}
