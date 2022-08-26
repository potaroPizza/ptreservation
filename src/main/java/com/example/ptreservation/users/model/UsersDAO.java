package com.example.ptreservation.users.model;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UsersDAO {
    List<UsersCategoryVO> selectAll();
}
