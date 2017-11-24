package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.TeachersEntity;
import com.netcracker.devschool.dev4.school.repository.TeachersEntityRepository;
import com.netcracker.devschool.dev4.school.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class TeachersServiceImpl implements TeachersService {

    @Autowired
    TeachersEntityRepository teachersEntityRepository;

    @Override
    public TeachersEntity addTeacher(TeachersEntity teachersEntity) {
        return teachersEntityRepository.save(teachersEntity);
    }

    @Override
    public void deleteTeacherById(int ID) {
        teachersEntityRepository.delete(ID);
    }

    @Override
    public TeachersEntity findById(int ID) {
        return teachersEntityRepository.findOne(ID);
    }

    @Override
    public List<TeachersEntity> getAllTeachers() {
        return (List<TeachersEntity>)teachersEntityRepository.findAll();
    }

    @Override
    public List<TeachersEntity> findBySubjectId(int id) {
        return teachersEntityRepository.findBySubjectId(id);
    }

    @Override
    public TeachersEntity findByLastName(String name) {
        return teachersEntityRepository.findByLastName(name);
    }
}
