package com.yitusite.buflo.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.yitusite.buflo.admin", "com.yitusite.buflo.common.bean"})
public class BufloUpmsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(BufloUpmsServiceApplication.class, args);
    }
}
