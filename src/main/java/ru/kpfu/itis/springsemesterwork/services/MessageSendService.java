package ru.kpfu.itis.springsemesterwork.services;

public interface MessageSendService {
    void sendMessage(String number, String name, String confirmCode);
}
