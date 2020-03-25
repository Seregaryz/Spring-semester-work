package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;

@Controller
public class ProfileController {

    @GetMapping("/profile")
    public String getProfile(Authentication authentication, Model model) {
        if(authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            return "profile";
        } else return "redirect:/signIn";
    }
}

