package com.example.boot06;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

import java.io.IOException;

/*
    @PropertySource(value= " 커스텀 properties 파일의 위치 ")
    classpath: 는 resources 폴더를 가리킨다.
 */
@SpringBootApplication
@PropertySource(value = "classpath:custom.properties")
public class Boot06WebConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(Boot06WebConfigApplication.class, args);

        MemberDto dto = new MemberDto();

        // 크롬을 실행해서 http://localhost:9000 로딩하기
        Runtime rt = Runtime.getRuntime();
        try {
            rt.exec("cmd /c start chrome.exe http://localhost:9000");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
