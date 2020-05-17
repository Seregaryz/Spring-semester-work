package ru.kpfu.itis.springsemesterwork.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.springsemesterwork.dto.CommentDto;
import ru.kpfu.itis.springsemesterwork.models.Comment;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.repositories.CommentsRepository;
import ru.kpfu.itis.springsemesterwork.repositories.UsersRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentsRepository commentsRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public List<Comment> getCommentsOfNews(long id){
        return commentsRepository.findAllByIdPost(id);
    }

    @Override
    public Comment getNewComment(LocalDateTime localDateTime) {
        return commentsRepository.findByCreatedAt(localDateTime);
    }

    @Override
    public LocalDateTime save(CommentDto commentDto) {
        User sender = usersRepository.findById(commentDto.getIdSender());
        Comment comment = Comment.builder()
                .sender(sender)
                .createdAt(LocalDateTime.now())
                .idPost(commentDto.getIdPost())
                .text(commentDto.getText())
                .build();
        commentsRepository.save(comment);
        return comment.getCreatedAt();
    }
}
