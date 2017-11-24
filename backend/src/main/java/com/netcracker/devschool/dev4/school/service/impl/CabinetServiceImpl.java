package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.CabinetEntity;
import com.netcracker.devschool.dev4.school.repository.CabinetEntityRepository;
import com.netcracker.devschool.dev4.school.service.CabinetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class CabinetServiceImpl implements CabinetService {

    @Autowired
    private CabinetEntityRepository cabinetEntityRepository;

    @Override
    public CabinetEntity addCabinet(CabinetEntity cabinetEntity) {
        return cabinetEntityRepository.save(cabinetEntity);
    }

    @Override
    public void deleteCabinetById(int ID) {
        cabinetEntityRepository.delete(ID);
    }

    @Override
    public CabinetEntity findById(int ID) {
        return cabinetEntityRepository.findOne(ID);
    }

    @Override
    public List<CabinetEntity> getAllCabinets() {
        return (List<CabinetEntity>) cabinetEntityRepository.findAll();
    }
}
