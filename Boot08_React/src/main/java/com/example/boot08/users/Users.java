package com.example.boot08.users;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
// @Table(name = "Users_tbl")
public class Users {

    @Id
    private String userName;
    private String password;
    private String email;
}
