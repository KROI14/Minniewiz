package com.example.minniewiz.classes;

public class QuizResult {

    private String question;
    private String imgs[];
    private String[] choices;
    private String userAnswer;
    private String correctAnswer;

    public QuizResult(String question, String imgs[], String[] choices, String userAnswer, String correctAnswer) {
        this.question = question;
        this.imgs = imgs;
        this.choices = choices;
        this.userAnswer = userAnswer;
        this.correctAnswer = correctAnswer;
    }

    public String getQuestion() {
        return question;
    }

    public String[] getImgs() {
        return imgs;
    }

    public String[] getChoices() {
        return choices;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }
}
