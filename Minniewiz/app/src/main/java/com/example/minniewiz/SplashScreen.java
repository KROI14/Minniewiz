package com.example.minniewiz;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class SplashScreen extends AppCompatActivity implements Runnable{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        Handler handler = new Handler();
        handler.postDelayed(this, 2000);
    }

    @Override
    public void run() {
        String userID = getSharedPreferences("LOGIN", MODE_PRIVATE).getString("USER_ID", "");
        if(userID.isEmpty()){
            startActivity(new Intent(this, Login.class));
            finish();
        }
        else{
            MainActivity.USER_ID = userID;
            startActivity(new Intent(this, MainActivity.class));
            finish();
        }
    }
}