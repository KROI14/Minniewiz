package com.example.minniewiz.classes;

public class QuestionChoices {

    private String questionID;
    private String question;
    private String[] images;
    private String[] choicesID;
    private String[] choices;
    private String correct;

    public QuestionChoices(String questionID, String question, String[] images, String[] choicesID, String[] choices, String correct) {
        this.questionID = questionID;
        this.question = question;
        this.images = images;
        this.choicesID = choicesID;
        this.choices = choices;
        this.correct = correct;
    }

    public String getQuestionID() {
        return questionID;
    }

    public String getQuestion() {
        return question;
    }

    public String[] getImages() {
        return images;
    }

    public String[] getChoices() {
        return choices;
    }

    public String getCorrect() {
        return correct;
    }
}
