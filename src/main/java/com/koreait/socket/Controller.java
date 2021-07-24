package com.koreait.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@org.springframework.stereotype.Controller
@RequestMapping("/map")
public class Controller {

    @Autowired
    asdService service;

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

    @RequestMapping("/detail")
    public String detail(){
        return "detail";
    }

//    @ResponseBody
//    @RequestMapping("")

    @RequestMapping("/map3")
    public String map3(){
        return "map3";
    }

    @ResponseBody
    @RequestMapping("/map3/{region}")
    public List<LocationEntity> map3(@PathVariable("region") String region){
        LocationEntity param=new LocationEntity();
        param.setRegion(region);
        System.out.println(region);
        return service.selLocation(param);
    }
}
