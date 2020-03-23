package ru.kpfu.itis.springsemesterwork.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.springsemesterwork.models.cookie.CookieValue;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.repositories.CookieValuesRepository;
import ru.kpfu.itis.springsemesterwork.repositories.UsersRepository;

import java.util.Optional;
import java.util.UUID;

@Service
public class SignInServiceImpl implements SignInService {
    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private CookieValuesRepository cookieValuesRepository;

    @Override
    public String signIn(String email, String password) {

        Optional<User> userOptional = usersRepository.findByEmail(email);
        User user = null;
        if(userOptional.isPresent()){
            user = userOptional.get();
        }
        String value = null;
        if (user != null && user.getHashPassword().equals(password)) {
            value = UUID.randomUUID().toString();
            CookieValue cookieValue = CookieValue.builder()
                    .value(value)
                    .user(user)
                    .build();
            cookieValuesRepository.save(cookieValue);
        }

        return value;
    }

}
