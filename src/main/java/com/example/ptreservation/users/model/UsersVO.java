package com.example.ptreservation.users.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UsersVO {
    private int no;
    private String name;
    private String id;
    private String pw;
    private String hp;
    private Timestamp regdate;
    private Timestamp outdate;
    private String point;
    private String kakao;
    private String usersCategoryCode;
}
