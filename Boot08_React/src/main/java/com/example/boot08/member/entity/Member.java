package com.example.boot08.member.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity     // 이 클래스를 Entity 로 사용하겠다.
@Table(name = "MEMBER_TBL")   // 테이블을 만들 때 테이블명은 MEMBER_TBL 로 하겠다.
public class Member {

    @Id
    private int num;    // 해당 칼럼을 PK 로 지정
    private String name;
    private String addr;

}
