package com.koreait.socket;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LocationEntity {
    private double location_Y;
    private double location_X;
    private String region;
}
