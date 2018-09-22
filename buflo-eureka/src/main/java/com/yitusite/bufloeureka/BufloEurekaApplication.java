package com.yitusite.bufloeureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class BufloEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(BufloEurekaApplication.class, args);
    }
}
