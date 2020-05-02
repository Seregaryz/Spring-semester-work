package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import ru.kpfu.itis.springsemesterwork.dto.CommentDto;
import ru.kpfu.itis.springsemesterwork.models.Comment;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.services.CommentService;
import ru.kpfu.itis.springsemesterwork.services.UserService;

import java.time.LocalDateTime;
import java.util.List;

@Component
public class AddCommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/addComment")
    public ResponseEntity<String> addComment(CommentDto form) {
        LocalDateTime createdAt = commentService.save(form);
        return ResponseEntity
                .ok()
                .body(createdAt.toString());
    }
}
