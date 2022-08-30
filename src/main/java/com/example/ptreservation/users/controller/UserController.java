package com.example.ptreservation.users.controller;

import com.example.ptreservation.users.model.UsersService;
import com.example.ptreservation.users.model.UsersVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UsersService usersService;
    private static final Logger logger
            = LoggerFactory.getLogger(UserController.class);

    @PostMapping("/login")
    public String login_post(@ModelAttribute UsersVO vo,
        @RequestParam(required = false) boolean rememberId,
        Model model) {
        logger.info("로그인 처리, vo ={}", vo);

        String msg = "로그인 실패";
        String url = "/";

        int result = usersService.loginChk(vo);
        System.out.println("로그인 처리 결과 : " + result);

        if(result == UsersService.LOGIN_OK){
            msg = "님 로그인 되었습니다.";
            url = "/main";
        }else if(result == UsersService.DISAGREE_PWD){
            msg = "비밀번호가 일치하지 않습니다.";
        }else if(result == UsersService.NONE_USERSID){
            msg = "아이디가 존재하지 않습니다.";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/common/message";
    }
    
    @GetMapping("/join")
    public String join_get() {
        System.out.println("회원가입 페이지");

        return "/join";
    }

    @PostMapping("/join")
    public String join_post(@ModelAttribute UsersVO vo, Model model) {
        System.out.println("회원가입 처리, vo = " + vo);

        String msg = "회원가입에 실패했습니다.";
        String url = "/";
        int cnt = usersService.insertUsers(vo);

        if(cnt > 0){
            msg = "회원가입에 성공했습니다.";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/common/message";
    }

    @GetMapping("chkIdDup")
    public String chkIdDup_get(@RequestParam String id, Model model) {
        System.out.println("아이디 중복확인 페이지");

        model.addAttribute("id", id);

        return "chkIdDup";
    }

    @PostMapping("chkIdDup")
    @ResponseBody
    public int chkIdDup_post(@RequestParam String id){
        System.out.println("ajax 아이디 중복확인 처리, id=" + id);

        // 중복확인 결과 1:중복, 0:중복아님
        int result = 0;

        if(id != null && !id.isEmpty()){
            result = usersService.chkIdDup(id);

            if(result > 0){
                result = 1;
            }
        }

        return result;
    }
}
