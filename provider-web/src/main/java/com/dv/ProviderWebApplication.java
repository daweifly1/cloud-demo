package com.dv;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class ProviderWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProviderWebApplication.class, args);
    }
}
