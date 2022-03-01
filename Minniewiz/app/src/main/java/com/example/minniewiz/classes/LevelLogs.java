package com.example.minniewiz.classes;

public class LevelLogs {

    private String dateTaken;
    private String levelName;
    private int score;
    private int items;

    public LevelLogs(String dateTaken, String levelName, int score, int items) {
        this.dateTaken = dateTaken;
        this.levelName = levelName;
        this.score = score;
        this.items = items;
    }

    public String getDateTaken() {
        return dateTaken;
    }

    public String getLevelName() {
        return levelName;
    }

    public int getScore() {
        return score;
    }

    public int getItems() {
        return items;
    }
}
