package com.example.boot08;

import com.example.boot08.member.entity.Member;
import com.example.boot08.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
public class Boot08ReactApplication {

    @Autowired
    private MemberRepository repo;

    // Boot08ReactApplication 객체가 생성된 이후에 자동 호출될 메소드
    @PostConstruct
    public void initMembers() {
        // DB 에 Sample 데이터를 저장하기
        List<Member> list = new ArrayList<Member>();
        list.add(new Member(1, "김구라", "노량진"));
        list.add(new Member(2, "해골", "행신동"));
        list.add(new Member(3, "원숭이", "동물원"));
        repo.saveAll(list);
    }

    public static void main(String[] args) {
        SpringApplication.run(Boot08ReactApplication.class, args);
    }

}