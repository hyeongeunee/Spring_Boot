package com.example.Boot01_Hello2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class Boot01Hello2Application {

    public static void main(String[] args) {
        // run() 메소드가 리턴해주는 ApplicationContext 객체의 참조값을 변수에 담고
        ApplicationContext ctx = SpringApplication.run(Boot01Hello2Application.class, args);
        // 해당 객체로부터 Car type 객체 얻어내기
        Car car1 = ctx.getBean(Car.class);
        car1.drive();

        Car car2 = ctx.getBean(Car.class);
        car2.drive();

        if (car1 == car2) {
            System.out.println("car1과 car2는 같아요");
        }
    }

}
