package com.dv.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by hzchendawei on 2018/8/28.
 */
@RestController
public class HelloController {

    @Value("${foo}")
    String foo;

    @RequestMapping("/hi")
    public String home() {
        return "foo:" + foo;
    }
}
