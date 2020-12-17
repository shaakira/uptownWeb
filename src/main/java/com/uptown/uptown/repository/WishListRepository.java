package com.uptown.uptown.repository;

import com.uptown.uptown.entity.Wishlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WishListRepository extends JpaRepository<Wishlist,Integer> {

    @Query("select wishlist from Wishlist wishlist where wishlist.user.Id=:userId")
    List<Wishlist> findWishlistList(@Param("userId") Integer id);
    @Query("select wishlist from Wishlist wishlist where wishlist.user.Id=:userId and wishlist.property.id=:propId")
    Optional<Wishlist> getWislisted(@Param("userId") Integer userId, @Param("propId") Integer propId);

}
