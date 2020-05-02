package ru.kpfu.itis.springsemesterwork.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Arrays;

@Component
@Aspect
@Slf4j
public class Advices {

    @Before(value = "execution(* ru.kpfu.itis.springsemesterwork.services.*.*(..))")
    public void requestLogging(JoinPoint jp){
        String[] packages = jp.getSignature().getDeclaringTypeName().split("\\.");
        String classOfMethod = packages[packages.length - 1];
        String[] times = LocalDateTime.now().toString().split("T");
        String date = times[0];
        String time = times[1];
        String params = (jp.getArgs().length == 0 ? "no params" : Arrays.toString(jp.getArgs()));
        log.info("\n request method: " + jp.getSignature().getName() + " of " + classOfMethod +
                " class. \n Request date: " + date + ". \n Request time: " + time + ". \n Method params: "
                + params);
    }
}
