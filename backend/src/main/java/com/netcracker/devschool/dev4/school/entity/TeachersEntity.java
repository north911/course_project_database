package com.netcracker.devschool.dev4.school.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "teachers", schema = "school")
public class TeachersEntity {

    private String firstName;

    private String lastName;

    private int qualification;

    @Id
    private int idTeacher;

    private int idSubject;


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getQualification() {
        return qualification;
    }

    public void setQualification(int qualification) {
        this.qualification = qualification;
    }

    public int getIdTeacher() {
        return idTeacher;
    }

    public void setIdTeacher(int idTeacher) {
        this.idTeacher = idTeacher;
    }


    public int getIdSubject() {
        return idSubject;
    }

    public void setIdSubject(int subjectIdSubject) {
        this.idSubject = subjectIdSubject;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TeachersEntity that = (TeachersEntity) o;

        if (qualification != that.qualification) return false;
        if (idTeacher != that.idTeacher) return false;
        if (idSubject != that.idSubject) return false;
        if (!firstName.equals(that.firstName)) return false;
        return lastName.equals(that.lastName);
    }

    @Override
    public int hashCode() {
        int result = firstName.hashCode();
        result = 31 * result + lastName.hashCode();
        result = 31 * result + qualification;
        result = 31 * result + idTeacher;
        result = 31 * result + idSubject;
        return result;
    }
}
