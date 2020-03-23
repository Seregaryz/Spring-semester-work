package ru.kpfu.itis.springsemesterwork.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

import java.util.List;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/post")
    public String getNewsPage(@RequestParam("id") Long id, Model model) {
        News news = newsService.showConcreteNews(id);
        model.addAttribute("news", news);
        return "newsPage";
    }
}
