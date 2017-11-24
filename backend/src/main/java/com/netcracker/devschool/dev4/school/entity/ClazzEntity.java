package com.netcracker.devschool.dev4.school.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "class", schema = "school")
public class ClazzEntity {

    @Id
    private int idClass;

    private String classManager;

    private int size;

    private String className;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }





    public int getIdClass() {
        return idClass;
    }

    public void setIdClass(int idClass) {
        this.idClass = idClass;
    }

    public String getClassManager() {
        return classManager;
    }

    public void setClassManager(String classManager) {
        this.classManager = classManager;
    }


    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClazzEntity that = (ClazzEntity) o;

        if (idClass != that.idClass) return false;
        if (size != that.size) return false;
        if (!classManager.equals(that.classManager)) return false;
        return className.equals(that.className);
    }

    @Override
    public int hashCode() {
        int result = idClass;
        result = 31 * result + classManager.hashCode();
        result = 31 * result + size;
        result = 31 * result + className.hashCode();
        return result;
    }
}
