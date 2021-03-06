package ru.kpfu.itis.springsemesterwork.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.models.Comment;
import ru.kpfu.itis.springsemesterwork.models.News;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.CommentService;
import ru.kpfu.itis.springsemesterwork.services.NewsService;

import java.util.List;

@Controller
public class NewsPageController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentService commentService;


    @GetMapping("/post")
    public String getNewsPage(@RequestParam("id") Long id, Model model, Authentication authentication) {
        News news = newsService.showConcreteNews(id);
        List<Comment> comments = commentService.getCommentsOfNews(id);
        model.addAttribute("news", news);
        model.addAttribute("comments", comments);
        if(authentication != null){
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            model.addAttribute("isAuth", true);
        } else model.addAttribute("isAuth", false);
        return "newsPage";
    }
}
