package com.yyx.controller;

import com.yyx.service.HelloService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/hello")
public class HelloMVCController {

    @Resource
    private HelloService helloService;

    // http://localhost:8080/hello/mvc
    @RequestMapping("/mvc")
    public String helloMVC(){
        System.out.println(helloService.sayHello());
        return "home/home";
    }


}
