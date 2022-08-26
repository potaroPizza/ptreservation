package com.example.ptreservation.users.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService {

    private final UsersDAO usersDAO;

    @Override
    public List<UsersCategoryVO> selectAll() {
        return usersDAO.selectAll();
    }
}
