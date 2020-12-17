package com.uptown.uptown.controller;

import com.uptown.uptown.entity.Wishlist;
import com.uptown.uptown.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WishListController {

    @Autowired
    private WishListService wishListService;

    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    @GetMapping("/addWishList/{propId}")
    public String addWishList(Wishlist wishlist, @PathVariable int propId, HttpSession session){
        Object id = session.getAttribute("userId");
        Integer userId = Integer.parseInt(id.toString());
        wishListService.addWishList(wishlist,propId,userId);
        return "redirect:/singleProperty/{propId}";
    }
    @GetMapping(value = "/wishList")
    public ModelAndView wishlist(ModelMap model,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("wishList");
        Object id = session.getAttribute("userId");
        Integer userId = Integer.parseInt(id.toString());
        List<Wishlist> wishlists = wishListService.getMyWishlistAppointments(userId);
        model.addAttribute("prop", wishlists);
        return modelAndView;
    }

    @GetMapping("/removeWishList/{id}")
    public  String removeWishList(@PathVariable int id){
        wishListService.removeWishList(id);
        return "redirect:/wishList";
    }
}
