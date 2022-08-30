package com.example.ptreservation.users.model;

import java.util.List;

public interface UsersService {
    int LOGIN_OK = 1;   // 로그인 성공
    int DISAGREE_PWD=2; // 비밀번호 불일치
    int NONE_USERSID=3;// 아이디 존재하지 않음

    List<UsersCategoryVO> selectAllUsersCategory();
    int chkIdDup(String id);
    int insertUsers(UsersVO vo);
    int loginChk(UsersVO vo);
}
