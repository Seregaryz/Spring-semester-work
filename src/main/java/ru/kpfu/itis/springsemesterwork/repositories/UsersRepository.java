package ru.kpfu.itis.springsemesterwork.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.user.User;

import java.util.List;
import java.util.Optional;

public interface UsersRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    Optional<User> findByConfirmCode(String confirmCode);
    List<User> findAllByNameContainsIgnoreCase(String name);
}
