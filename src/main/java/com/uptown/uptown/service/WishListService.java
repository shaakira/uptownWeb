package com.uptown.uptown.service;

import com.uptown.uptown.entity.Appointment;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.entity.Wishlist;
import com.uptown.uptown.repository.PropertyRepository;
import com.uptown.uptown.repository.UserRepository;
import com.uptown.uptown.repository.WishListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WishListService {
    @Autowired
    private WishListRepository wishListRepository;
    @Autowired
    private PropertyRepository propertyRepository;
    @Autowired
    private UserRepository userRepository;

    public String addWishList(Wishlist wishlist, Integer propId, Integer userId) {
        User customer = userRepository.findById(userId).orElse(null);
        Property property = propertyRepository.findById(propId).orElse(null);
        wishlist.setUser(customer);
        wishlist.setProperty(property);
        wishListRepository.save(wishlist);
        return "added successfully";
    }


    public List<Wishlist> getMyWishlistAppointments(int id) {
        return wishListRepository.findWishlistList(id);
    }

    public String removeWishList(int id) {
        wishListRepository.deleteById(id);
        return "wishList removed " + id;
    }

    public boolean getwishlisted(int userId, int propId) {
        boolean list;
        Wishlist wishlist = wishListRepository.getWislisted(userId, propId).orElse(null);
        if (wishlist == null) {
            list = false;
        } else {
            list = true;
        }

        return list;
    }

    public Wishlist getMobileWishlisted(int userId, int propId) {

        Wishlist wishlist = wishListRepository.getWislisted(userId, propId).orElse(null);
        return wishlist;
    }

    public Wishlist getWishListById(int id) {
        Wishlist wishlist = wishListRepository.findById(id).orElse(null);
        return wishlist;
    }

}
