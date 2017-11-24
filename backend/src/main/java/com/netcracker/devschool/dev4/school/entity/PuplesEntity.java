package com.netcracker.devschool.dev4.school.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "puples", schema = "school")
public class PuplesEntity {
    @Id
    private int idPuple;

    private String firstName;

    private String sex;

    private String lastName;

    private Date dateOfBirth;

    private int idClass;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PuplesEntity that = (PuplesEntity) o;

        if (idPuple != that.idPuple) return false;
        if (idClass != that.idClass) return false;
        if (!firstName.equals(that.firstName)) return false;
        if (!sex.equals(that.sex)) return false;
        if (!lastName.equals(that.lastName)) return false;
        return dateOfBirth.equals(that.dateOfBirth);
    }

    @Override
    public int hashCode() {
        int result = idPuple;
        result = 31 * result + firstName.hashCode();
        result = 31 * result + sex.hashCode();
        result = 31 * result + lastName.hashCode();
        result = 31 * result + dateOfBirth.hashCode();
        result = 31 * result + idClass;
        return result;
    }

    public int getIdPuple() {

        return idPuple;
    }

    public void setIdPuple(int idPuple) {
        this.idPuple = idPuple;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public java.util.Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getIdClass() {
        return idClass;
    }

    public void setIdClass(int idClass) {
        this.idClass = idClass;
    }
}
