// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.rooinaction.coursemanager.domain.Instructor;

privileged aspect Instructor_Roo_Jpa_Entity {
    
    declare @type: Instructor: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Instructor.id;
    
    @Version
    @Column(name = "version")
    private Integer Instructor.version;
    
    public Long Instructor.getId() {
        return this.id;
    }
    
    public void Instructor.setId(Long id) {
        this.id = id;
    }
    
    public Integer Instructor.getVersion() {
        return this.version;
    }
    
    public void Instructor.setVersion(Integer version) {
        this.version = version;
    }
    
}
