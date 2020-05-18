package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.dto.ProfileForm;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.UserService;

import javax.validation.Valid;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public String getProfile(Authentication authentication, Model model) {
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            User user = userService.getUserById(userDetails.getUser().getId());
            model.addAttribute("user", user);
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

    @GetMapping("/profileRedaction")
    public String getProfileRedaction(Authentication authentication, Model model) {
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            User user = userDetails.getUser();
            model.addAttribute("user", user);
            model.addAttribute("profileForm", new ProfileForm());
            return "profileRedaction";
        } else return "redirect:/signIn";
    }

    @PostMapping("/profileRedaction")
    public String updateProfile(Authentication authentication, @Valid ProfileForm form, BindingResult bindingResult, Model model) {
        if(authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            if(bindingResult.hasErrors()) {
                System.out.println(form);
                model.addAttribute("user", userDetails.getUser());
                System.out.println(bindingResult.getAllErrors());
                model.addAttribute("profileForm", form);
                return "profileRedaction";
            } else {
                User user = userDetails.getUser();
                User updatedUser = userService.getUserById(user.getId());
                updatedUser.setEmail(form.getEmail());
                updatedUser.setName(form.getName());
                updatedUser.setSurname(form.getSurname());
                updatedUser.setNickname(form.getNickname());
                updatedUser.setNumber(form.getNumber());
                userService.saveUser(updatedUser);
                return "redirect:/profile";
            }
        } else return "redirect:/signIn";
    }

}

