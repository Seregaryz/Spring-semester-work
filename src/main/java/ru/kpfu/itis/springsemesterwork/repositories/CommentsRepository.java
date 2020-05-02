package ru.kpfu.itis.springsemesterwork.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.Comment;

import java.time.LocalDateTime;
import java.util.List;

public interface CommentsRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByIdPost(long id);

    Comment findByCreatedAt(LocalDateTime localDateTime);
}
