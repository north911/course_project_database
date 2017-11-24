package com.netcracker.devschool.dev4.school.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "cabinet", schema = "school")
public class CabinetEntity {

    @Id
    private int idCabinet;

    private int floor;

    public int getIdCabinet() {
        return idCabinet;
    }

    public void setIdCabinet(int idCabinet) {
        this.idCabinet = idCabinet;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CabinetEntity that = (CabinetEntity) o;

        if (idCabinet != that.idCabinet) return false;
        if (floor != that.floor) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCabinet;
        result = 31 * result + floor;
        return result;
    }

    @Override
    public String toString() {
        return "floor is " + floor + " id is: " + idCabinet;
    }
}
