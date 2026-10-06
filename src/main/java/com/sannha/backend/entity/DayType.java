package com.sannha.backend.entity;

import java.time.DayOfWeek;
import java.time.LocalDate;

public enum DayType {
    WEEKDAY, WEEKEND;

    public static DayType of(LocalDate date) {
        DayOfWeek d = date.getDayOfWeek();
        return (d == DayOfWeek.SATURDAY || d == DayOfWeek.SUNDAY) ? WEEKEND : WEEKDAY;
    }
}