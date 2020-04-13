package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.dto.SignUpDto;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

@Controller
public class AddNewsController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/addPost")
    public String getNewPostPage(Authentication authentication, Model model) {
        if(authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            model.addAttribute("isAuth", true);
        } else  model.addAttribute("isAuth", false);
        return "add-post";
    }

    @PostMapping("/addPost")
    public String signUp(News news) {
        newsService.save(news);
        return "redirect:/newsList";
    }
}
