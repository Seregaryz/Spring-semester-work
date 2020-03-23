package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.dto.SignUpDto;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

@Controller
public class NewPostController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/addPost")
    public String getNewPostPage() { return "addPost"; }

    @PostMapping("/addPost")
    public String signUp(News news) {
        newsService.save();
        return "redirect:/signUp";
    }
}
