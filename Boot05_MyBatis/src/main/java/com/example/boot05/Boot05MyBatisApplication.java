package com.example.boot05;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class Boot05MyBatisApplication {

    public static void main(String[] args) {
        SpringApplication.run(Boot05MyBatisApplication.class, args);

        // 크롬을 실행해서
        Runtime rt = Runtime.getRuntime();
        try {
            rt.exec("cmd /c start chrome.exe http://localhost:9000/boot05");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
