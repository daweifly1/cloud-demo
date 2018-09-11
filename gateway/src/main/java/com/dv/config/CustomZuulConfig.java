package com.dv.config;

import com.dv.zuul.CustomRouteLocator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.zuul.filters.ZuulProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomZuulConfig {

    @Autowired
    ZuulProperties zuulProperties;
    @Autowired
    CustomRouteLocator routeLocator;

    @Bean
    public CustomRouteLocator routeLocator() {
        routeLocator.setProperties(zuulProperties);
        return routeLocator;
    }

}
