package com.koreait.socket;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
@RequestMapping("/map")
public class Controller {
    @RequestMapping("/map1")
    public void asd(){

    }
    @RequestMapping("/search")
    public String serch(){
        return "search";
    }

    @RequestMapping("/search2")
    public String serch2(){
        return "search2";
    }
}
