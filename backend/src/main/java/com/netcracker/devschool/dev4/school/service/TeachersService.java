package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.TeachersEntity;

import java.util.List;

public interface TeachersService {

    TeachersEntity addTeacher(TeachersEntity teachersEntity);
    void deleteTeacherById(int ID);
    TeachersEntity findById(int ID);
    List<TeachersEntity> getAllTeachers();
    List<TeachersEntity> findBySubjectId(int id);
    TeachersEntity findByLastName (String name);
}
