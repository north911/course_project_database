package com.netcracker.devschool.dev4.school.entity;

import javax.persistence.*;

@Entity
@Table(name = "timetable", schema = "school")
public class TimetableEntity {

    @Id
    private int id;

    private int dayOfWeek;

    private int numberOfLesson;

    private int idTeacher;

    private int idSubject;

    private int idClass;

    private int idCabinet;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getNumberOfLesson() {
        return numberOfLesson;
    }

    public void setNumberOfLesson(int numberOfLesson) {
        this.numberOfLesson = numberOfLesson;
    }

    public int getidTeacher() {
        return idTeacher;
    }

    public void setidTeacher(int idTeacher) {
        this.idTeacher = idTeacher;
    }

    public int getidSubject() {
        return idSubject;
    }

    public void setidSubject(int idSubject) {
        this.idSubject = idSubject;
    }

    public int getidClass() {
        return idClass;
    }

    public void setidClass(int idClass) {
        this.idClass = idClass;
    }

    public int getidCabinet() {
        return idCabinet;
    }

    public void setidCabinet(int idCabinet) {
        this.idCabinet = idCabinet;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TimetableEntity that = (TimetableEntity) o;

        if (id != that.id) return false;
        if (dayOfWeek != that.dayOfWeek) return false;
        if (numberOfLesson != that.numberOfLesson) return false;
        if (idTeacher != that.idTeacher) return false;
        if (idSubject != that.idSubject) return false;
        if (idClass != that.idClass) return false;
        return idCabinet == that.idCabinet;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + dayOfWeek;
        result = 31 * result + numberOfLesson;
        result = 31 * result + idTeacher;
        result = 31 * result + idSubject;
        result = 31 * result + idClass;
        result = 31 * result + idCabinet;
        return result;
    }
}
