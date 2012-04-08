package org.rooinaction.coursemanager.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Student {

    @NotNull
    @Size(min = 2)
    private String name;

    @Size(max = 30)
    private String address;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Course> courses = new HashSet<Course>();
}
