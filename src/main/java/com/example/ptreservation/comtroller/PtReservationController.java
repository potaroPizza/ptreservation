package com.example.ptreservation.comtroller;

import com.example.ptreservation.users.model.UsersCategoryVO;
import com.example.ptreservation.users.model.UsersService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PtReservationController {

    private final UsersService usersService;

    @RequestMapping("/")
    public String home(Model model) {
        System.out.println("예약 홈페이지 첫 화면");

        List<UsersCategoryVO> list = usersService.selectAllUsersCategory();

        model.addAttribute("list", list);

        System.out.println(list);

        return "/index";
    }

}
