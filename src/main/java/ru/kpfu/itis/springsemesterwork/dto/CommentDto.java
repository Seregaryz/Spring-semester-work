package ru.kpfu.itis.springsemesterwork.dto;

import lombok.Data;

@Data
public class CommentDto {

    private long idPost, idSender;
    private String text;
}
