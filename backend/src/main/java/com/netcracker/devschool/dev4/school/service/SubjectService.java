package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.SubjectEntity;

import java.util.List;

public interface SubjectService {

    SubjectEntity addSubject(SubjectEntity subjectEntity);
    void deleteSubjectById(int ID);
    SubjectEntity findById(int ID);
    List<SubjectEntity> getAllSubjects();
}
