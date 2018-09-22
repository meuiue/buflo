package com.yitusite.bufloupmsservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.yitusite.bufloupmsservice", "com.yitusite.buflocommon.bean"})
public class BufloUpmsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(BufloUpmsServiceApplication.class, args);
    }
}
