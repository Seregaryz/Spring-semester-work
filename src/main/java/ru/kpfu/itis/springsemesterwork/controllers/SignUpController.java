package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.kpfu.itis.springsemesterwork.dto.SignUpDto;
import ru.kpfu.itis.springsemesterwork.services.FileStorageService;
import ru.kpfu.itis.springsemesterwork.services.SignUpService;

import javax.servlet.http.HttpServletResponse;

@Controller
public class SignUpController {

    @Autowired
    private SignUpService service;

    @GetMapping("/signUp")
    public String getSignUpPage(Authentication authentication) {
        if(authentication != null) return "registration";
        else return "registration";
    }

    @PostMapping("/signUp")
    public String signUp(SignUpDto form) {
        service.signUp(form);
        return "redirect:/signIn";
    }

}

