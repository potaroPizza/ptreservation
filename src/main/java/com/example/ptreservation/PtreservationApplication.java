package com.example.ptreservation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class PtreservationApplication {

    public static void main(String[] args) {
        SpringApplication.run(PtreservationApplication.class, args);
    }

}
