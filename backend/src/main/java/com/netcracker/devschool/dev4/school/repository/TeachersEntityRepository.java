package com.netcracker.devschool.dev4.school.repository;

import com.netcracker.devschool.dev4.school.entity.TeachersEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TeachersEntityRepository extends CrudRepository<TeachersEntity, Integer> {

    @Query("select s from TeachersEntity s where s.idSubject = :idSubject")
    List<TeachersEntity> findBySubjectId(@Param("idSubject") int idSubject);

    @Query("select s from TeachersEntity s where s.lastName = :lastName")
    TeachersEntity findByLastName(@Param("lastName") String lastName);


}
