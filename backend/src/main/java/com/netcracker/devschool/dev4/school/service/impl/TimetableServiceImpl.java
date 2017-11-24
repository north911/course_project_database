package com.netcracker.devschool.dev4.school.service.impl;

import com.netcracker.devschool.dev4.school.entity.TimetableEntity;
import com.netcracker.devschool.dev4.school.repository.TimetableEntityRepository;
import com.netcracker.devschool.dev4.school.service.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class TimetableServiceImpl implements TimetableService {
    @Autowired
    TimetableEntityRepository timetableEntityRepository;

    @Override
    public TimetableEntity addIntoTimetable(TimetableEntity timetableEntity) {
        return timetableEntityRepository.save(timetableEntity);
    }

    @Override
    public void deleteFromTimetable(int ID) {
        timetableEntityRepository.delete(ID);
    }

    @Override
    public TimetableEntity findById(int ID) {
        return timetableEntityRepository.findOne(ID);
    }

    @Override
    public List<TimetableEntity> findAll() {
        return (List<TimetableEntity>)timetableEntityRepository.findAll();
    }

    @Override
    public TimetableEntity saveTime(TimetableEntity timetableEntity) {
        return timetableEntityRepository.save(timetableEntity);
    }

    @Override
    public List<TimetableEntity> findByIdTeacher(int id , int day) {
        return timetableEntityRepository.findByIdTeacher(id,day);
    }

    @Override
    public List<TimetableEntity> findByIdClass(int id, int day) {
        return timetableEntityRepository.findByIdClassAAndDayOfWeek(id,day);
    }
}
