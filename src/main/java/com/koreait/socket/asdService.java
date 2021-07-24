package com.koreait.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class asdService {

    @Autowired
    asdMapper mapper;

    public List<LocationEntity> selLocation(LocationEntity param){
        return mapper.selLocation(param);
    }
}
