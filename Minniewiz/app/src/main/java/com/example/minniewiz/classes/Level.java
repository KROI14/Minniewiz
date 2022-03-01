package com.example.minniewiz.classes;

public class Level {

    private String levelID;
    private String name;
    private long timeDuration;
    private boolean isTaken;
    private boolean isLocked;

    public Level(String levelID, String name, Long timeDuration, boolean isTaken, boolean isLocked) {
        this.levelID = levelID;
        this.name = name;
        this.timeDuration = timeDuration;
        this.isTaken = isTaken;
        this.isLocked = isLocked;
    }

    public String getLevelID() {
        return levelID;
    }

    public String getName() {
        return name;
    }

    public long getTimeDuration() {
        return timeDuration;
    }

    public boolean isTaken() {
        return isTaken;
    }

    public boolean isLocked() { return isLocked; }
}
