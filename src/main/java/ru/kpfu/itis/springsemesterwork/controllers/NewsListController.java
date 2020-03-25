package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

import java.util.List;

@Controller
public class NewsListController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/newsList")
    public String getNewsListPage(Authentication authentication, Model model) {
        if(authentication != null) {
            List<News> news = newsService.showNews();
            model.addAttribute("news", news);
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            User user = userDetails.getUser();
            model.addAttribute("user", user);
            model.addAttribute("isAuth", true);
            return "newsList";
        } else return "redirect:/signIn";
    }
}
