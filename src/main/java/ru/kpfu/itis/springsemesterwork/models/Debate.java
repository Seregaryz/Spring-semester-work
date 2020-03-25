package ru.kpfu.itis.springsemesterwork.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.kpfu.itis.springsemesterwork.models.user.User;

import javax.persistence.*;
import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "debates")
public class Debate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String topic;
    private Date date;
    @OneToOne
    private User creator;
    @OneToOne
    private User secondDebater;
}
