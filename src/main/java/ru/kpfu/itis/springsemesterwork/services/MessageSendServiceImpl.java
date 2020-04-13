package ru.kpfu.itis.springsemesterwork.services;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class MessageSendServiceImpl implements MessageSendService {

    @Override
    public void sendMessage(String number, String name, String confirmCode) {
        RestTemplate restTemplate = new RestTemplate();
        String messageServiceUrl = "https://gate.smsaero.ru/v2/sms/send";
        HttpHeaders headers = new HttpHeaders();
        headers.setBasicAuth("seregaryz@gmail.com", "e9AyTtAPO6h0DIhzYIPCJtbejnFD");
        MultiValueMap<String, String> map= new LinkedMultiValueMap<>();
        map.add("sign", "SMS Aero");
        map.add("channel", "DIRECT");
        map.add("number", number);
        map.add("text", name + ", please, confirm your account. To verify your account, follow this link: "
                + "localhost/confirm/" + confirmCode);
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
        restTemplate.postForEntity(messageServiceUrl, request , String.class);
    }
}
