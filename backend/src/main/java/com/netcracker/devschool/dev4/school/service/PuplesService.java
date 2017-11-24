package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.PuplesEntity;

import java.util.List;

public interface PuplesService {

    PuplesEntity addPupel(PuplesEntity puplesEntity);
    void deletePupelById(int ID);
    PuplesEntity findById(int ID);
    List<PuplesEntity> getAllPupels();
}
