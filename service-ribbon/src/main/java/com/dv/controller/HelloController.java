package com.dv.controller;

import com.dv.service.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by hzchendawei on 2018/8/28.
 */
@RestController
public class HelloController {

    @Autowired
    HelloService helloService;

    @RequestMapping("/hello")
    public String home(@RequestParam(value = "name", defaultValue = "forezp") String name) {
        return helloService.hiService(name);
    }
}
