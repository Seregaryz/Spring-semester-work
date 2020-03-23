package ru.kpfu.itis.springsemesterwork.services;

public interface EmailService {
    void sendMail(String subject, String html, String email);
}

