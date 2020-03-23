package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

import java.util.List;

@Controller
public class NewsListController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/newsList")
    public String getNewsListPage(Model model) {
        List<News> news = newsService.showNews();
        model.addAttribute("news", news);
        return "newsList";
    }
}
