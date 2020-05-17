package ru.kpfu.itis.springsemesterwork.models.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "messages")
public class ChatMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idMessage;

    @Enumerated(value = EnumType.STRING)
    private MessageType type;

    private String content;
    private String sender;

}