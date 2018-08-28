package com.dv.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by hzchendawei on 2018/8/28.
 */
@FeignClient(value = "provider-web")
public interface SchedualService {
    @RequestMapping(value = "/hi", method = RequestMethod.GET)
    String sayHiFromClientOne(@RequestParam(value = "name") String name);
}
