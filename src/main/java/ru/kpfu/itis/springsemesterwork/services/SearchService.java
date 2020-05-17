package ru.kpfu.itis.springsemesterwork.services;

import ru.kpfu.itis.springsemesterwork.dto.NewsSearchResult;

public interface SearchService {

    NewsSearchResult searchNews(String query, Integer page, Integer size);
}
