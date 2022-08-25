package com.example.ptreservation.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @GetMapping("/hello")
    public String hello() {
        System.out.println("제발 한글");
        return "hello";
    }

}
