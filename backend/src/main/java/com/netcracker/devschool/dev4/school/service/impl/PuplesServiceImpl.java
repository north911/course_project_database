package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.PuplesEntity;
import com.netcracker.devschool.dev4.school.repository.PuplesEntityRepository;
import com.netcracker.devschool.dev4.school.service.PuplesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class PuplesServiceImpl implements PuplesService {

    @Autowired
    private PuplesEntityRepository puplesEntityRepository;


    @Override
    public PuplesEntity addPupel(PuplesEntity puplesEntity) {
        return puplesEntityRepository.save(puplesEntity);
    }

    @Override
    public void deletePupelById(int ID) {

        puplesEntityRepository.delete(ID);

    }

    @Override
    public PuplesEntity findById(int ID) {
        return puplesEntityRepository.findOne(ID);
    }

    @Override
    public List<PuplesEntity> getAllPupels() {
        return (List<PuplesEntity>) puplesEntityRepository.findAll();
    }
}
