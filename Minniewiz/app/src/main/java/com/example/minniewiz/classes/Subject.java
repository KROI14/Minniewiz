package com.example.minniewiz.classes;

public class Subject {

    private String name;
    private String subjectID;

    public Subject(String subjectID, String name){
        this.name = name;
        this.subjectID = subjectID;
    }

    public String getName() {
        return name;
    }

    public String getSubjectID() {
        return subjectID;
    }
}
