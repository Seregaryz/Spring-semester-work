package ru.kpfu.itis.springsemesterwork.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.News;

public interface NewsRepository extends JpaRepository<News, Long> {
}
