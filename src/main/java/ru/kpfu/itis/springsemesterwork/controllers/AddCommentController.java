package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import ru.kpfu.itis.springsemesterwork.dto.CommentDto;
import ru.kpfu.itis.springsemesterwork.security.UserDetailsImpl;
import ru.kpfu.itis.springsemesterwork.services.CommentService;

@Controller
public class AddCommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping(value = "/addComment")
    public String addComment(CommentDto commentDto, Authentication authentication, Model model) {
        if(authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            model.addAttribute("user", userDetails.getUser());
            model.addAttribute("isAuth", true);
            commentService.save(commentDto);
            return "redirect:/post?id=" + commentDto.getIdPost();
        } else return "redirect:/signIn";
    }
}
