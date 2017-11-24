package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.ClazzEntity;
import com.netcracker.devschool.dev4.school.repository.ClazzEntityRepository;
import com.netcracker.devschool.dev4.school.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Transactional
@Service
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzEntityRepository clazz;

    @Override
    public ClazzEntity addClass(ClazzEntity clazzEntity) {
        return clazz.save(clazzEntity);
    }

    @Override
    public void deleteClassById(int ID) {
        clazz.delete(ID);
    }

    @Override
    public ClazzEntity findById(int ID) {
        return clazz.findOne(ID);
    }

    @Override
    public List<ClazzEntity> getAllClasses() {
        return (List<ClazzEntity>)clazz.findAll();
    }

    @Override
    public ClazzEntity findByClassName(String name) {
        return clazz.findByClazzName(name);
    }
}
