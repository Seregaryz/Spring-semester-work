package ru.kpfu.itis.springsemesterwork.services;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import ru.kpfu.itis.springsemesterwork.dto.SignUpDto;
import ru.kpfu.itis.springsemesterwork.models.user.Role;
import ru.kpfu.itis.springsemesterwork.models.user.State;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.repositories.UsersRepository;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;

@Component
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ExecutorService executorService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private Configuration freemarkerConfig;

    @Override
    public void signUp(SignUpDto form) {
        User user = User.builder()
                .email(form.getEmail())
                .hashPassword(passwordEncoder.encode(form.getPassword()))
                .username(form.getUsername())
                .createdAt(LocalDateTime.now())
                .state(State.NOT_CONFIRMED)
                .role(Role.USER)
                .nickname(form.getNickname())
                .confirmCode(UUID.randomUUID().toString())
                .build();
        usersRepository.save(user);
        Template t = null;
        Map model = new HashMap();
        model.put("username", user.getEmail());
        model.put("link", "localhost/confirm/" + user.getConfirmCode());
        try {
            t = freemarkerConfig.getTemplate("mail-temp.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, model);
            executorService.submit(() ->
                    emailService.sendMail("Confirm", html, user.getEmail()));
        } catch (IOException e) {
            throw new IllegalStateException(e);
        } catch (TemplateException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
