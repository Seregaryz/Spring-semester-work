package ru.kpfu.itis.springsemesterwork.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.message.ChatMessage;

public interface MessageRepository extends JpaRepository<ChatMessage, Long> {
}
