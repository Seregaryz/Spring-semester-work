package ru.kpfu.itis.springsemesterwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.springsemesterwork.services.MessageSendService;

@Controller
public class SendCodeController {

    @Autowired
    private MessageSendService messageSendService;

    @PostMapping("/sendCode")
    public ResponseEntity<Integer> sendCode(@RequestParam("number")String number){
        int code = messageSendService.sendMessage(number);
        return ResponseEntity
                .ok()
                .body(code);
    }
}
