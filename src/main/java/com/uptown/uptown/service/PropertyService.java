package com.uptown.uptown.service;

import com.uptown.uptown.entity.Property;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.exception.FileStorageException;
import com.uptown.uptown.repository.PropertyRepository;
import com.uptown.uptown.repository.UserRepository;
import com.uptown.uptown.security.service.PdfUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class PropertyService {

    @Autowired
    private PropertyRepository repository;
    @Autowired
    private UserRepository userRepository;
    @Value("${C:\\Users\\SHAAKIRA\\Desktop\\uptown\\src\\main\\webapp\\resources\\Image}")
    public String uploadDir;


    public void saveProperty(Property property,  MultipartFile[] files)
    {
        Arrays.asList(files)
                .stream()
                .forEach(file -> upload(file));

        User loggedInUser = ((PdfUserDetails)  SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserDetails();
        property.setUser(loggedInUser);
        property.setImage1(files[0].getOriginalFilename());
        property.setImage2(files[1].getOriginalFilename());
        property.setImage3(files[2].getOriginalFilename());
        repository.save(property);
    }

    public void savePropertyMobile(Property property,   List<MultipartFile> files,int id)
    {
        files.stream().forEach(file->upload(file));
        User user=  userRepository.findById(id).get();
        property.setUser(user);
        property.setImage1(files.get(0).getOriginalFilename());
        property.setImage2(files.get(1).getOriginalFilename());
        property.setImage3(files.get(2).getOriginalFilename());
        repository.save(property);
    }
    public List<Property> saveProperties(List<Property> properties){
        return repository.saveAll(properties);
    }

    public List<Property> getPropertyList(){
       List<Property> properties= repository.findPendingProperty();
       return  properties;
    }
    public Property getPropertyById(int id){
        return repository.findById(id).orElse(null);
    }

    public String deleteProperty(int id){
        repository.deleteById(id);
        return "property removed" +id;
    }
    public Property updateProperty(Property property){
        Property existingProperty=repository.findById(property.getId()).orElse(null);
        existingProperty.setHeading(property.getHeading());
        existingProperty.setStatus(property.getStatus());
        return  repository.save(existingProperty);
    }

    public void upload( MultipartFile file){
        try {
            Path copyLocation = Paths
                    .get(uploadDir + File.separator + StringUtils.cleanPath(file.getOriginalFilename()));
            Files.copy(file.getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
        }
       catch (Exception e){

       }

    }
    @Transactional
    public String acceptProperty(int id){
        repository.acceptProperty(id);
        return "property accepted" +id;
    }
    @Transactional
    public String rejectProperty(int id){
        repository.rejectProperty(id);
        return "property rejected" +id;
    }

    public List<Property> getPublishedProperty(){
        return repository.findPublishedProperty();
    }
    public List<Property> getMyProperties(int id){
        return repository.findMyProperty(id);
    }
    public List<Property> getRequest(int id){
        return repository.findRequest(id);
    }
    public List<Property> getMyRejectedProp(int id){
        return repository.findMyRejectedProp(id);
    }
    @Transactional
    public String requestAgain(int id){
        repository.requestAgain(id);
        return "request again" +id;
    }
    @Transactional
    public String deleteProperty(Integer id,Integer uId){
        repository.deleteUserProperty(id,uId);
        return "property removed " ;
    }
    public List<Property> getLatestProperty(){
        List<Property> properties=repository.findLatestProperty();
        List<Property> latest=new ArrayList<>();
        latest.add(properties.get(0));
        latest.add(properties.get(1));
        latest.add(properties.get(2));
        return  latest;
    }
    public Optional<Property> getSinglePropertyById(Integer Id) {
        return  repository.getSingleProperty(Id);
    }

    public List<Property> searchWithHeading(String heading,String city,String pType,int baths,int rooms,int garage){
        List<Property> properties= repository.searchWithHeading(heading,city,pType,baths,rooms,garage);
        return  properties;
    }
    public List<Property> searchWithoutHeading(String city,String pType,int baths,int rooms,int garage){
        List<Property> properties= repository.searchWithoutHeading(city,pType,baths,rooms,garage);
        return  properties;
    }
    public List<Property> searchCity(String city){
        List<Property> properties= repository.searchCity(city);
        return  properties;
    }

    public Optional<Property> getSinglePendingPropertyById(Integer Id) {
        return  repository.getSinglePendingProperty(Id);
    }
}
