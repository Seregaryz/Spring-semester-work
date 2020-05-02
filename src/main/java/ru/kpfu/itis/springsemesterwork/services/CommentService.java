package ru.kpfu.itis.springsemesterwork.services;

import ru.kpfu.itis.springsemesterwork.dto.CommentDto;
import ru.kpfu.itis.springsemesterwork.models.Comment;

import java.time.LocalDateTime;
import java.util.List;

public interface CommentService {

    List<Comment> getCommentsOfNews(long id);

    Comment getNewComment(LocalDateTime localDateTime);

    LocalDateTime save(CommentDto commentDto);
}
