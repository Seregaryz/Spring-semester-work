package ru.kpfu.itis.springsemesterwork.dto;

import lombok.Data;
import ru.kpfu.itis.springsemesterwork.models.user.Sex;

@Data
public class SignUpDto {
    private String email;
    private String password;
    private String username;
    private String nickname;
    private String photoPath;
    private Sex sex;
}

