package com.example.ptreservation.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @PostMapping("/login")
    public String login(Model model) {
        System.out.println("로그인 처리");

        String msg = "로그인 성공";
        String url = "/main";

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/common/message";
    }
    
    @GetMapping("/join")
    public String join() {
        System.out.println("회원가입 페이지");

        return "/join";
    }
}
