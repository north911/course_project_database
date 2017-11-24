package com.netcracker.devschool.dev4.school.service;

import com.netcracker.devschool.dev4.school.entity.CabinetEntity;

import java.util.List;

public interface CabinetService {

    CabinetEntity addCabinet(CabinetEntity cabinetEntity);
    void deleteCabinetById(int ID);
    CabinetEntity findById(int ID);
    List<CabinetEntity> getAllCabinets();

}
