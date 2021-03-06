// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.jsf;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.rooinaction.coursemanager.jsf.TrainingProgramBean;
import org.rooinaction.coursemanager.jsf.util.MessageFactory;
import org.rooinaction.coursemanager.model.Course;
import org.rooinaction.coursemanager.model.TrainingProgram;

privileged aspect TrainingProgramBean_Roo_ManagedBean {
    
    declare @type: TrainingProgramBean: @ManagedBean(name = "trainingProgramBean");
    
    declare @type: TrainingProgramBean: @SessionScoped;
    
    private String TrainingProgramBean.name = "TrainingPrograms";
    
    private TrainingProgram TrainingProgramBean.trainingProgram;
    
    private List<TrainingProgram> TrainingProgramBean.allTrainingPrograms;
    
    private boolean TrainingProgramBean.dataVisible = false;
    
    private List<String> TrainingProgramBean.columns;
    
    private HtmlPanelGrid TrainingProgramBean.createPanelGrid;
    
    private HtmlPanelGrid TrainingProgramBean.editPanelGrid;
    
    private HtmlPanelGrid TrainingProgramBean.viewPanelGrid;
    
    private boolean TrainingProgramBean.createDialogVisible = false;
    
    private List<Course> TrainingProgramBean.selectedCourses;
    
    @PostConstruct
    public void TrainingProgramBean.init() {
        columns = new ArrayList<String>();
        columns.add("name");
    }
    
    public String TrainingProgramBean.getName() {
        return name;
    }
    
    public List<String> TrainingProgramBean.getColumns() {
        return columns;
    }
    
    public List<TrainingProgram> TrainingProgramBean.getAllTrainingPrograms() {
        return allTrainingPrograms;
    }
    
    public void TrainingProgramBean.setAllTrainingPrograms(List<TrainingProgram> allTrainingPrograms) {
        this.allTrainingPrograms = allTrainingPrograms;
    }
    
    public String TrainingProgramBean.findAllTrainingPrograms() {
        allTrainingPrograms = TrainingProgram.findAllTrainingPrograms();
        dataVisible = !allTrainingPrograms.isEmpty();
        return null;
    }
    
    public boolean TrainingProgramBean.isDataVisible() {
        return dataVisible;
    }
    
    public void TrainingProgramBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid TrainingProgramBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void TrainingProgramBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid TrainingProgramBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void TrainingProgramBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid TrainingProgramBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void TrainingProgramBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid TrainingProgramBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel nameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        nameCreateOutput.setFor("nameCreateInput");
        nameCreateOutput.setId("nameCreateOutput");
        nameCreateOutput.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameCreateOutput);
        
        InputText nameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameCreateInput.setId("nameCreateInput");
        nameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{trainingProgramBean.trainingProgram.name}", String.class));
        nameCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(nameCreateInput);
        
        Message nameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameCreateInputMessage.setId("nameCreateInputMessage");
        nameCreateInputMessage.setFor("nameCreateInput");
        nameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameCreateInputMessage);
        
        HtmlOutputText coursesCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesCreateOutput.setId("coursesCreateOutput");
        coursesCreateOutput.setValue("Courses:");
        htmlPanelGrid.getChildren().add(coursesCreateOutput);
        
        HtmlOutputText coursesCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesCreateInput.setId("coursesCreateInput");
        coursesCreateInput.setValue("This relationship is managed from the Course side");
        htmlPanelGrid.getChildren().add(coursesCreateInput);
        
        Message coursesCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        coursesCreateInputMessage.setId("coursesCreateInputMessage");
        coursesCreateInputMessage.setFor("coursesCreateInput");
        coursesCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(coursesCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TrainingProgramBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel nameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        nameEditOutput.setFor("nameEditInput");
        nameEditOutput.setId("nameEditOutput");
        nameEditOutput.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameEditOutput);
        
        InputText nameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameEditInput.setId("nameEditInput");
        nameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{trainingProgramBean.trainingProgram.name}", String.class));
        nameEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(nameEditInput);
        
        Message nameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameEditInputMessage.setId("nameEditInputMessage");
        nameEditInputMessage.setFor("nameEditInput");
        nameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameEditInputMessage);
        
        HtmlOutputText coursesEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesEditOutput.setId("coursesEditOutput");
        coursesEditOutput.setValue("Courses:");
        htmlPanelGrid.getChildren().add(coursesEditOutput);
        
        HtmlOutputText coursesEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesEditInput.setId("coursesEditInput");
        coursesEditInput.setValue("This relationship is managed from the Course side");
        htmlPanelGrid.getChildren().add(coursesEditInput);
        
        Message coursesEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        coursesEditInputMessage.setId("coursesEditInputMessage");
        coursesEditInputMessage.setFor("coursesEditInput");
        coursesEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(coursesEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TrainingProgramBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameLabel.setId("nameLabel");
        nameLabel.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameLabel);
        
        HtmlOutputText nameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameValue.setId("nameValue");
        nameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{trainingProgramBean.trainingProgram.name}", String.class));
        htmlPanelGrid.getChildren().add(nameValue);
        
        HtmlOutputText coursesLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesLabel.setId("coursesLabel");
        coursesLabel.setValue("Courses:");
        htmlPanelGrid.getChildren().add(coursesLabel);
        
        HtmlOutputText coursesValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        coursesValue.setId("coursesValue");
        coursesValue.setValue("This relationship is managed from the Course side");
        htmlPanelGrid.getChildren().add(coursesValue);
        
        return htmlPanelGrid;
    }
    
    public TrainingProgram TrainingProgramBean.getTrainingProgram() {
        if (trainingProgram == null) {
            trainingProgram = new TrainingProgram();
        }
        return trainingProgram;
    }
    
    public void TrainingProgramBean.setTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingProgram = trainingProgram;
    }
    
    public List<Course> TrainingProgramBean.getSelectedCourses() {
        return selectedCourses;
    }
    
    public void TrainingProgramBean.setSelectedCourses(List<Course> selectedCourses) {
        if (selectedCourses != null) {
            trainingProgram.setCourses(new HashSet<Course>(selectedCourses));
        }
        this.selectedCourses = selectedCourses;
    }
    
    public String TrainingProgramBean.onEdit() {
        if (trainingProgram != null && trainingProgram.getCourses() != null) {
            selectedCourses = new ArrayList<Course>(trainingProgram.getCourses());
        }
        return null;
    }
    
    public boolean TrainingProgramBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void TrainingProgramBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String TrainingProgramBean.displayList() {
        createDialogVisible = false;
        findAllTrainingPrograms();
        return "trainingProgram";
    }
    
    public String TrainingProgramBean.displayCreateDialog() {
        trainingProgram = new TrainingProgram();
        createDialogVisible = true;
        return "trainingProgram";
    }
    
    public String TrainingProgramBean.persist() {
        String message = "";
        if (trainingProgram.getId() != null) {
            trainingProgram.merge();
            message = "message_successfully_updated";
        } else {
            trainingProgram.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "TrainingProgram");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTrainingPrograms();
    }
    
    public String TrainingProgramBean.delete() {
        trainingProgram.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "TrainingProgram");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTrainingPrograms();
    }
    
    public void TrainingProgramBean.reset() {
        trainingProgram = null;
        selectedCourses = null;
        createDialogVisible = false;
    }
    
    public void TrainingProgramBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
