package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.ClazzEntity;

import java.util.List;

public interface ClazzService {

    ClazzEntity addClass(ClazzEntity clazzEntity);
    void deleteClassById(int ID);
    ClazzEntity findById(int ID);
    List<ClazzEntity> getAllClasses();
    ClazzEntity findByClassName(String name);
}
