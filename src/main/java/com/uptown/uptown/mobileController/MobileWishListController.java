package com.uptown.uptown.mobileController;

import com.uptown.uptown.entity.Wishlist;
import com.uptown.uptown.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/wishList")
@RestController
public class MobileWishListController {

    private WishListService wishListService;

    @Autowired
    public MobileWishListController(WishListService wishListService) {
        this.wishListService = wishListService;
    }

    @PostMapping("/addWishList/{propId}/{userId}")
    public String addWishList(@RequestBody Wishlist wishlist, @PathVariable int propId,@PathVariable int userId){
        wishListService.addWishList(wishlist,propId,userId);
        return "Success";
    }
    @GetMapping("getWishList/{userId}")
    public List<Wishlist> getWishLists(@PathVariable int userId) {
        List<Wishlist> wishLists = wishListService.getMyWishlistAppointments(userId);
        return wishLists;
    }

    @GetMapping("/removeWishList/{id}")
    public  String removeWishList(@PathVariable int id){
        wishListService.removeWishList(id);
        return "Successfully Removed";
    }
    @GetMapping("/wishList/{id}")
    public Wishlist getWishList(@PathVariable("id") int id) {
        Wishlist wishlist = wishListService.getWishListById(id);
        return wishlist;
    }

    @GetMapping("getWishListed/{propId}/{userId}")
    public boolean getWishListed(@PathVariable("propId") int propId,@PathVariable("userId")int userId){
        Boolean listed=wishListService.getwishlisted(userId,propId);
        return  listed;
    }

}
