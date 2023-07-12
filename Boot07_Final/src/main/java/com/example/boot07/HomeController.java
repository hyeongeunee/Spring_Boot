package com.example.boot07;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home(HttpServletRequest request) {
        List<String> noticeList = new ArrayList<>();
        noticeList.add("집에");
        noticeList.add("가고 싶다");

        request.setAttribute("noticeList", noticeList);

        return "home";
    }
}