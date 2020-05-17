package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.dto.NewsSearchResult;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.SearchService;

@Controller
public class SearchController {

    @Autowired
    private SearchService service;

    @PostMapping("/searchNews")
    public String getSearch(@RequestParam("q") String query, Model model, Authentication authentication) {
        NewsSearchResult result = service.searchNews(query, 0, 10);
        model.addAttribute("result", result);
        if(authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            User user = userDetails.getUser();
            model.addAttribute("user", user);
            model.addAttribute("isAuth", true);
            return "searchResults";
        } else {
            model.addAttribute("isAuth", false);
            return "searchResults";
        }
    }

}

