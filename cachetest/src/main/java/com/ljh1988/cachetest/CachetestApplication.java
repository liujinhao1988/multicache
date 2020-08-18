package com.ljh1988.cachetest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication

public class CachetestApplication {

    public static void main(String[] args) {
        SpringApplication.run(CachetestApplication.class, args);
    }

}
