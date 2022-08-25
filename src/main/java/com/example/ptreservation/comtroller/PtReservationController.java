package com.example.ptreservation.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PtReservationController {

    @GetMapping("/")
    public String home() {
        System.out.println("예약 홈페이지");
        return "/index";
    }

}
