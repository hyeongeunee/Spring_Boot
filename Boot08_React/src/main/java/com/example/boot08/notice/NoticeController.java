package com.example.boot08.notice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController     // REST API 를 좀 더 편하게 만들기 위한 어노테이션
public class NoticeController {
    // 공지사항을 json 문자열 ["xxx", "xxx", ....] 을 출력하기 위한 컨트롤러 메소드
    @GetMapping("/notice")
    public List<String> getNotice() {
        // DB 에서 읽어온 공지 사항이라고 가정
        List<String> list = new ArrayList<String>();
        list.add("React 공부중입니다.");
        list.add("Build 도 했는데 재밌네요~");
        list.add("어쩌구 저쩌구..");
        return list;
    }
}
