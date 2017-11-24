package com.netcracker.devschool.dev4.school.repository;

import com.netcracker.devschool.dev4.school.entity.TimetableEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TimetableEntityRepository extends CrudRepository<TimetableEntity, Integer> {

    @Query("select s from TimetableEntity s where s.idTeacher = :idTeacher AND s.dayOfWeek = :dayOfWeek")
    List<TimetableEntity> findByIdTeacher(@Param("idTeacher") int idTeacher,@Param("dayOfWeek") int dayOfWeek);

    @Query("select s from TimetableEntity s where s.idClass = :idClass AND s.dayOfWeek = :dayOfWeek")
    List<TimetableEntity> findByIdClassAAndDayOfWeek(@Param("idClass") int idTeacher,@Param("dayOfWeek") int dayOfWeek);
}
