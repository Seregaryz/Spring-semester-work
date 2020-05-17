package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.UserService;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public String getProfile(Authentication authentication, Model model) {
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            return "profile";
        } else return "redirect:/signIn";
    }

    @GetMapping("/profileOfUser")
    public String getProfileOfUser(@RequestParam("userId") Long id, Authentication authentication, Model model) {
        User anotherUser = userService.getUserById(id);
        model.addAttribute("anotherUser", anotherUser);
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            model.addAttribute("isAuth", true);
            if (userDetails.getUser().equals(anotherUser)) {
                return "redirect:/profile";
            }
            return "profileOfUser";
        } else {
            model.addAttribute("isAuth", false);
            return "profileOfUser";
        }
    }
}

