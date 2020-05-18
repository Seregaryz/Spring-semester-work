package ru.kpfu.itis.springsemesterwork.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProfileForm {

    @Email(message = "{errors.incorrect.email}")
    private String email;

    @Size(min = 3, message = "{errors.name.required}")
    @NotNull(message = "{errors.name.required}")
    private String name;

    @Size(min = 3, message = "{errors.surname.required}")
    @NotNull(message = "{errors.surname.required}")
    private String surname;

    @Size(min = 3, message = "{errors.nickname.required}")
    @NotNull(message = "{errors.nickname.required}")
    private String nickname;

    @Size(min = 8, message = "{errors.number.required}")
    @NotNull(message = "{errors.number.required}")
    private String number;

}
