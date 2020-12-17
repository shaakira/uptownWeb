package com.uptown.uptown.controller;

import com.uptown.uptown.dto.UserDTO;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.service.PropertyService;
import com.uptown.uptown.service.UserService;
import com.uptown.uptown.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@CrossOrigin(origins = "*")
@Controller
public class PropertyController {

    @Autowired
    private PropertyService service;
    @Autowired
    private UserService userService;
    @Autowired
    private WishListService wishListService;
    @PostMapping("/addPropertyPost")
    public String addPropertyPost(@RequestParam("files") MultipartFile[] files, Model model, Property property) {
        service.saveProperty(property, files);
        model.addAttribute("successful", "Pass");
        return "redirect:/myProperty";
    }

    @PostMapping("/addProperties")
    public List<Property> addProperties(List<Property> properties) {
        return service.saveProperties(properties);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/propertyList")
    public ModelAndView findAllPropertyList(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("propertyList");
        List<Property> properties = service.getPropertyList();
        model.addAttribute("properties", properties);
        List<Property> published = service.getPublishedProperty();
        model.addAttribute("published", published);
        return modelAndView;
    }

    @GetMapping("/propertyById/{id}")
    public Property findPropertyById(@PathVariable int id) {
        return service.getPropertyById(id);
    }

    @PutMapping("/updateProperty")
    public Property updateProduct(@RequestBody Property property) {
        return service.updateProperty(property);
    }

    @DeleteMapping("/deleteProperty/{id}")
    public String deleteProduct(@PathVariable int id) {
        return service.deleteProperty(id);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/acceptProperty/{id}")
    public String acceptProperty(@PathVariable int id) {
        service.acceptProperty(id);
        return "redirect:/propertyList";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/rejectProperty/{id}")
    public String rejectProperty(@PathVariable int id) {
        service.rejectProperty(id);
        return "redirect:/propertyList";
    }

    @GetMapping("/myProperty")
    public ModelAndView findMyProperties(ModelMap model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("myProperty");
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        List<Property> published = service.getMyProperties(Id);
        model.addAttribute("myProperty", published);
        List<Property> reject = service.getMyRejectedProp(Id);
        model.addAttribute("rejectedProperty", reject);
        List<Property> request = service.getRequest(Id);
        model.addAttribute("request", request);
        return modelAndView;
    }

    @GetMapping("/requestAgain/{id}")
    public String requestAgain(@PathVariable int id) {
        service.requestAgain(id);
        return "redirect:/myProperty";
    }

    @GetMapping("/deleteProperty/{propId}")
    public String deleteProperty(@PathVariable int propId,HttpSession session) {
        Object id = session.getAttribute("userId");
        Integer Id = Integer.parseInt(id.toString());
        service.deleteProperty(propId,Id);
        return "redirect:/myProperty";

    }
    @GetMapping(value = "/properties")
    public ModelAndView propertyGrid(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("properties");
        List<Property> properties = service.getPublishedProperty();
        model.addAttribute("prop", properties);
        return modelAndView;
    }
    @GetMapping("/singleProperty/{id}")
    public ModelAndView agentSingle(@PathVariable int id, ModelMap modelMap, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("/singleProperty");
        Property properties = service.getSinglePropertyById(id).orElse(null);
        String[] am=properties.getFeatures().split(",");
        List<String> f=Arrays.asList(am);
        modelMap.addAttribute("features",f);
        modelMap.addAttribute("prop", properties);
        modelMap.addAttribute("agent",properties.getUser());
        Object userId = session.getAttribute("userId");
        if(userId!=null)
        {
            User user = userService.getUserByUserId(Integer.parseInt(userId.toString()));
            modelMap.addAttribute("customer",user);
            boolean listed=wishListService.getwishlisted(Integer.parseInt(userId.toString()),id);
            if(listed){
                modelMap.addAttribute("listed",listed);
            }
            else{
                modelMap.addAttribute("listed",listed);
            }
        }

        return modelAndView;

    }

    @GetMapping(value = "/search")
    public ModelAndView searchProperty(String heading,String city,String pType,int baths,int rooms,int garage,ModelMap modelMap){
        ModelAndView modelAndView;
        if(heading.equals(null)||heading.equals("")){
            modelAndView = new ModelAndView("searchProperty");
            List<Property> properties = service.searchWithoutHeading(city,pType,baths,rooms,garage);
            modelMap.addAttribute("SearchProp1", properties);
            return modelAndView;

        }
        else {
            modelAndView = new ModelAndView("searchProperty");
            List<Property> properties = service.searchWithHeading(heading,city,pType,baths,rooms,garage);
            modelMap.addAttribute("SearchProp2", properties);
            return modelAndView;

        }
    }

}
