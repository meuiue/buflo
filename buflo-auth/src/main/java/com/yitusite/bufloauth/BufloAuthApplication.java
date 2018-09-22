package com.yitusite.bufloauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@ComponentScan(basePackages = {"com.yitusite.bufloauth", "com.yitusite.buflocommon.bean"})
public class BufloAuthApplication {

    public static void main(String[] args) {

        SpringApplication.run(BufloAuthApplication.class, args);
    }
}
