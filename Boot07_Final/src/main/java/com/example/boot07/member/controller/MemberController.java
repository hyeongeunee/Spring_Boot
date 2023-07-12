package com.example.boot07.member.controller;

import com.example.boot07.member.dao.MemberDao;
import com.example.boot07.member.dto.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    MemberDao dao;

    @GetMapping("/member/list")
    public ModelAndView list(ModelAndView mView) {
        // 회원 목록
        List<MemberDto> list = dao.getList();

        mView.addObject("list", list);
        mView.setViewName("member/list");

        return mView;
    }
}
