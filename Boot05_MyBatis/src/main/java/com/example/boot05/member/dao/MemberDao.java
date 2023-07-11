package com.example.boot05.member.dao;

import com.example.boot05.member.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDao {
    @Autowired
    SqlSession session;

    public List<MemberDto> getList() {
        return session.selectList("member.getList");
    }
}
