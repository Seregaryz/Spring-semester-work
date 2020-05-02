package ru.kpfu.itis.springsemesterwork.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.springsemesterwork.models.user.User;
import ru.kpfu.itis.springsemesterwork.repositories.UsersRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UsersRepository usersRepository;

    @Override
    public User getUserById(long id) {
        return usersRepository.findById(id);
    }
}
