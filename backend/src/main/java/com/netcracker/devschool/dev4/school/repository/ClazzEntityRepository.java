package com.netcracker.devschool.dev4.school.repository;

import com.netcracker.devschool.dev4.school.entity.ClazzEntity;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ClazzEntityRepository extends CrudRepository<ClazzEntity, Integer> {

    @Query("select s from ClazzEntity s where s.className = :className")
    ClazzEntity findByClazzName(@Param("className")String className);
}
