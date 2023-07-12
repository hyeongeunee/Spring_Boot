package com.example.boot06;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class Boot06WebConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(Boot06WebConfigApplication.class, args);

        // 크롬을 실행해서 http://localhost:9000 로딩하기
        Runtime rt = Runtime.getRuntime();
        try {
            rt.exec("cmd /c start chrome.exe http://localhost:9000");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
