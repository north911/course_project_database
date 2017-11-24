package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.TeachersEntity;
import com.netcracker.devschool.dev4.school.entity.TimetableEntity;

import java.util.List;

public interface TimetableService {
    TimetableEntity addIntoTimetable(TimetableEntity timetableEntity);
    void deleteFromTimetable(int ID);
    TimetableEntity findById(int ID);
    List<TimetableEntity> findAll();
    TimetableEntity saveTime(TimetableEntity timetableEntity);
    List<TimetableEntity> findByIdTeacher (int id , int day);
    List<TimetableEntity> findByIdClass(int id,int day);


}
