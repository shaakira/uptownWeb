package com.uptown.uptown.mobileController;


import com.uptown.uptown.dto.LoginResponse;
import com.uptown.uptown.dto.UserDTO;
import com.uptown.uptown.entity.User;
import com.uptown.uptown.request.AuthRequest;
import com.uptown.uptown.security.service.PdfUserDetails;
import com.uptown.uptown.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@CrossOrigin(origins = "*")
@RequestMapping("/mobile/api/auth")
@RestController
public class MobileAuthController {

    private AuthService authService;
    private UserDetailsService userDetailsService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public MobileAuthController(AuthService authService,UserDetailsService userDetailsService,PasswordEncoder passwordEncoder) {
        this.authService = authService;
        this.userDetailsService=userDetailsService;
        this.passwordEncoder=passwordEncoder;
    }

    @PostMapping("/signUp")
    public String registerUser(@RequestPart("file")MultipartFile file, @RequestPart("user") User registerUser) {
        String response= authService.registerUserService(registerUser,file);
        return response;
    }


    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public LoginResponse postLogin(HttpSession session, @RequestBody AuthRequest authRequest) {
        User loggedInUser = null;
        // String token = null;
        try {
            UserDetails userDetails = userDetailsService.loadUserByUsername(authRequest.getUserName());
            if (!passwordEncoder.matches(authRequest.getPassword(), userDetails.getPassword())) {
                throw new BadCredentialsException("Bad Credentials");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            // token = jwtTokenUtil.generateToken(userDetails);
            loggedInUser   = ((PdfUserDetails) authentication.getPrincipal()).getUserDetails();

        } catch (AuthenticationException e) {

        }
        if(loggedInUser!=null) {
            LoginResponse loginResponse = new LoginResponse(loggedInUser.getId(),loggedInUser.getUserName(), loggedInUser.getEmail(), loggedInUser.getuType(),loggedInUser.getStatus());
            return loginResponse;
        }
        else
        {
            return null;
        }
    }
}
