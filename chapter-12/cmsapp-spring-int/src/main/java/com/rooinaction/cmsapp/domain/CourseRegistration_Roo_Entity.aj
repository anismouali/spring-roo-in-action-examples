// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rooinaction.cmsapp.domain;

import com.rooinaction.cmsapp.domain.CourseRegistration;
import java.lang.Long;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CourseRegistration_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CourseRegistration.entityManager;
    
    @Transactional
    public void CourseRegistration.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CourseRegistration.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CourseRegistration attached = CourseRegistration.findCourseRegistration(this.id_);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CourseRegistration.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CourseRegistration.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CourseRegistration CourseRegistration.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CourseRegistration merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager CourseRegistration.entityManager() {
        EntityManager em = new CourseRegistration().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CourseRegistration.countCourseRegistrations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CourseRegistration o", Long.class).getSingleResult();
    }
    
    public static List<CourseRegistration> CourseRegistration.findAllCourseRegistrations() {
        return entityManager().createQuery("SELECT o FROM CourseRegistration o", CourseRegistration.class).getResultList();
    }
    
    public static CourseRegistration CourseRegistration.findCourseRegistration(Long id_) {
        if (id_ == null) return null;
        return entityManager().find(CourseRegistration.class, id_);
    }
    
    public static List<CourseRegistration> CourseRegistration.findCourseRegistrationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CourseRegistration o", CourseRegistration.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}