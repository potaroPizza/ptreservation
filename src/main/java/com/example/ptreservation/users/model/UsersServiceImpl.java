package com.example.ptreservation.users.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService {

    private final UsersDAO usersDAO;

    @Override
    public List<UsersCategoryVO> selectAllUsersCategory() {
        return usersDAO.selectAllUsersCategory();
    }

    @Override
    public int chkIdDup(String id) {
        return usersDAO.chkIdDup(id);
    }

    @Override
    public int insertUsers(UsersVO vo) {
        return usersDAO.insertUsers(vo);
    }

    // 일반회원 로그인
    @Override
    public int loginChk(UsersVO vo) {
        String inputId = vo.getId();
        String inputPw = vo.getPw();

        String dbPw = usersDAO.selectPw(inputId);
        int result = 0;

        if(dbPw != null && !dbPw.isEmpty()){
            if(dbPw.equals(inputPw)){
                result = UsersService.LOGIN_OK;
            }else{
                result = UsersService.DISAGREE_PWD;
            }
        }else{
            result = UsersService.NONE_USERSID;
        }

        return result;
    }

}
