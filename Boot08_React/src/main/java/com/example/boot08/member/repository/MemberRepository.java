package com.example.boot08.member.repository;

import com.example.boot08.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
/*
    Member Entity 에 대해서 insert, update, delete, select 작업을 대신해 줄
    Repository 만들기

    extends JpaRepository<Entity type, id 역할을 하는 필드의 type>
 */
public interface MemberRepository extends JpaRepository<Member, Integer> {
}
