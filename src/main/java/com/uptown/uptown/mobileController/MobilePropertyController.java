package com.uptown.uptown.mobileController;

import com.uptown.uptown.dto.PropertySearchDTO;
import com.uptown.uptown.entity.Property;
import com.uptown.uptown.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/property")
@RestController
public class MobilePropertyController {

    private PropertyService propertyService;

    @Autowired
    public MobilePropertyController(PropertyService propertyService) {
        this.propertyService = propertyService;
    }

    @PostMapping("/addPropertyPost")
    public String addPropertyPost(@RequestPart("file")List<MultipartFile> file, @RequestPart("property") Property property, @RequestPart("id") int id) {
        propertyService.savePropertyMobile(property, file,id);
        return "SucessFully Added Property";
    }


    @GetMapping(value = "/publishedProp")
    public List<Property> propertyGrid() {
        List<Property> properties = propertyService.getPublishedProperty();
        return properties;
    }

    @GetMapping("/singleProperty/{id}")
    public Property agentSingle(@PathVariable int id) {
        Property property = propertyService.getSinglePropertyById(id).orElse(null);
        return property;
    }

    @PostMapping(value = "/search")
    public List<Property> searchProperty(@RequestBody PropertySearchDTO property) {
        List<Property> properties;

        if (property.getHeading().equals(null) || property.getHeading().equals("")) {
            properties = propertyService.searchWithoutHeading(property.getCity(), property.getpType(), property.getBaths(), property.getRooms(), property.getGarage());

            return properties;

        } else {

          properties = propertyService.searchWithHeading(property.getHeading(), property.getCity(), property.getpType(), property.getBaths(), property.getRooms(), property.getGarage());

            return properties;
        }
    }
    @GetMapping(value = "/search/{city}")
    public List<Property> searchCity(@PathVariable String city) {
        List<Property> properties = propertyService.searchCity(city);
        return properties;
    }
    @GetMapping("/myProperty/pending/{advertiserId}")
    public List<Property> myPendingProperties(@PathVariable int advertiserId) {
        List<Property> properties = propertyService.getRequest(advertiserId);
        return properties;
    }
    @GetMapping("/myProperty/published/{advertiserId}")
    public List<Property> myPublishedProperties(@PathVariable int advertiserId) {
        List<Property> properties = propertyService.getMyProperties(advertiserId);
        return properties;
    }
    @GetMapping("/myProperty/reject/{advertiserId}")
    public List<Property> myRejectedProperties(@PathVariable int advertiserId) {
        List<Property> properties = propertyService.getMyRejectedProp(advertiserId);
        return properties;
    }
    @GetMapping("/requestAgain/{propId}")
    public String requestAgain(@PathVariable int propId) {
        propertyService.requestAgain(propId);
        return "Success";
    }

    @GetMapping("/deleteProperty/{propId}/{advertiserId}")
    public String deleteProperty(@PathVariable int propId,@PathVariable int advertiserId) {
        propertyService.deleteProperty(propId,advertiserId);
        return "Success";
    }
    @GetMapping("/admin/pending")
    public List<Property> pendingProperties() {
        List<Property> properties = propertyService.getPropertyList();
        return properties;
    }
    @GetMapping("/admin/published")
    public List<Property> publishedProperties() {
        List<Property> properties = propertyService.getPublishedProperty();
        return properties;
    }
    @GetMapping("/singleProperty/pending/{id}")
    public Property pendingSingle(@PathVariable int id) {
        Property property = propertyService.getSinglePendingPropertyById(id).orElse(null);
        return property;
    }
    @GetMapping("/admin/acceptProperty/{propId}")
    public String acceptProperty(@PathVariable int propId) {
        propertyService.acceptProperty(propId);
        return "Success";
    }


    @GetMapping("/admin/rejectProperty/{propId}")
    public String rejectProperty(@PathVariable int propId) {
        propertyService.rejectProperty(propId);
        return "Success";
    }
}
