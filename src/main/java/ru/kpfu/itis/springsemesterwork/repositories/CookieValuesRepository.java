package ru.kpfu.itis.springsemesterwork.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.cookie.CookieValue;

public interface CookieValuesRepository extends JpaRepository<CookieValue, Long> {
    CookieValue findByValue(String value);
}
