package com.dv.service;

import org.springframework.stereotype.Component;

/**
 * Created by hzchendawei on 2018/8/28.
 */
@Component
public class SchedualServiceHystric implements SchedualService {
    @Override
    public String sayHiFromClientOne(String name) {
        return "sayHiFromClientOne!!";
    }
}
