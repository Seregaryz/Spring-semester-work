package ru.kpfu.itis.springsemesterwork.services;

import ru.kpfu.itis.springsemesterwork.models.user.User;

public interface UserService {

    User getUserById(long id);

    void saveUser(User newUser);
}
