package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.SubjectEntity;
import com.netcracker.devschool.dev4.school.repository.SubjectEntityRepository;
import com.netcracker.devschool.dev4.school.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Transactional
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    SubjectEntityRepository subjectEntityRepository;

    @Override
    public SubjectEntity addSubject(SubjectEntity subjectEntity) {
        return subjectEntityRepository.save(subjectEntity);
    }

    @Override
    public void deleteSubjectById(int ID) {
        subjectEntityRepository.delete(ID);

    }

    @Override
    public SubjectEntity findById(int ID) {
        return subjectEntityRepository.findOne(ID);
    }

    @Override
    public List<SubjectEntity> getAllSubjects() {
        return (List<SubjectEntity>) subjectEntityRepository.findAll();
    }
}
