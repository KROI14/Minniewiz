package com.example.minniewiz.classes;

public class Leaderboard {

    private int rank;
    private String userID;
    private String userName;
    private float userScore;
    private String imgUser;

    public Leaderboard(int rank, String userName, String userID, float userScore, String imgUser) {
        this.rank = rank;
        this.userName = userName;
        this.userID = userID;
        this.userScore = userScore;
        this.imgUser = imgUser;
    }

    public int getRank() {
        return rank;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserID() {return userID; }

    public float getUserScore() {
        return userScore;
    }

    public String getImgUser() {
        return imgUser;
    }
}
