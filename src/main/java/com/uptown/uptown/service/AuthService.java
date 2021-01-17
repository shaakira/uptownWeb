package com.uptown.uptown.service;


import com.uptown.uptown.entity.Authority;
import com.uptown.uptown.entity.AuthorityType;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.repository.UserRepository;
import com.uptown.uptown.request.AuthRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class AuthService {

    private AuthenticationManager authenticationManager;
    private AuthorityService authorityService;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private UserRepository userRepository;
    @Value("${C:\\Users\\SHAAKIRA\\Desktop\\EEA1\\uptown\\src\\main\\webapp\\resources\\Image}")
    public String uploadDir;

    @Autowired
    public AuthService(AuthorityService authorityService, UserRepository userRepository , BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.authorityService = authorityService;
        this.bCryptPasswordEncoder=bCryptPasswordEncoder;
        this.userRepository = userRepository;
    }


    public String registerUserService(User registerUser, MultipartFile file) {

        if (userRepository.existsByUserName(registerUser.getUserName())) {
            return "Error: Username already taken!";
        }
        if (userRepository.existsByEmail(registerUser.getEmail())) {
            return "Error: Email already taken!";
        }
        else{
            try {
                Path copyLocation = Paths
                        .get(uploadDir + File.separator + StringUtils.cleanPath(file.getOriginalFilename()));
                Files.copy(file.getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
                User user = new User(
                        registerUser.getUserName(),
                        registerUser.getFirstName(),
                        registerUser.getLastName(),
                        registerUser.getEmail(),
                        registerUser.getAddress(),
                        registerUser.getuType(),
                        bCryptPasswordEncoder.encode(registerUser.getPassword())
                );

                user.setImage(file.getOriginalFilename());

                System.out.println("register 1");
                Set<Authority> mappedAuthorities = new HashSet<>();
                if(registerUser.getuType().equals("customer"))
                {
                    Authority authority=authorityService.getRoleByName(AuthorityType.ROLE_CUSTOMER);
                    mappedAuthorities.add(authority);
                    user.setAuthorities(mappedAuthorities);
                }
                else if(registerUser.getuType().equals("agent"))
                {
                    Authority authority=authorityService.getRoleByName(AuthorityType.ROLE_AGENT);
                    mappedAuthorities.add(authority);
                    user.setAuthorities(mappedAuthorities);
                }
                else if(registerUser.getuType().equals("owner"))
                {
                    Authority authority=authorityService.getRoleByName(AuthorityType.ROLE_OWNER);
                    mappedAuthorities.add(authority);
                    user.setAuthorities(mappedAuthorities);
                }

                userRepository.save(user);

                //create a new user account after the checking
                return "User Registered Successfully";
            }
            catch (Exception e){
                return "Error Response"+e;

            }
        }

    }

    public Boolean loginUserServices(AuthRequest authRequest) {

        if (!userRepository.existsByUserName(authRequest.getUserName())) {
            return false;
        } else
        {

            UsernamePasswordAuthenticationToken authReq
                    = new UsernamePasswordAuthenticationToken(authRequest.getUserName(), authRequest.getPassword());
            Authentication auth = authenticationManager.authenticate(authReq);
            SecurityContext sc = SecurityContextHolder.getContext();
            sc.setAuthentication(auth);
            System.out.println(auth);

            return true;
        }
    }

//    public JwtResponse loginUserService(AuthRequest authRequest) {
////        if (!userRepository.existsByUserName(authRequest.getUserName())) {
////            return "User name doesn't exists"+authRequest.getUserName()+" "+authRequest.getPassword();
////        } else
//            Authentication authentication = authenticationManager.authenticate(
//                    new UsernamePasswordAuthenticationToken(authRequest.getUserName(), authRequest.getPassword()));
//
////            SecurityContextHolder.getContext().setAuthentication(authentication);
////            String jwt = jwtUtils.generateJwtToken((authentication));
////            Date expiretime = jwtUtils.expirationTime();
////            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
////
////            List<String> roles = userDetails.getAuthorities().stream()
////                    .map(item -> item.getAuthority())
////                    .collect(Collectors.toList());
////            return (new JwtResponse(jwt,
////                    userDetails.getId(),
////                    userDetails.getUsername(),
////                    roles, expiretime));
//        return  new JwtResponse();
//
//    }
}
