package ru.kpfu.itis.springsemesterwork.services;

import ru.kpfu.itis.springsemesterwork.models.News;

import java.util.List;

public interface NewsService {
    List<News> showNews();

    News showConcreteNews(Long id);

    void save(News news);
}
