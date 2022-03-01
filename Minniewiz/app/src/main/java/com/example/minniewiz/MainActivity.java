package com.example.minniewiz;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.MenuItem;

import com.example.minniewiz.menu_pages.History;
import com.example.minniewiz.menu_pages.Leaderboard;
import com.example.minniewiz.menu_pages.Profile;
import com.example.minniewiz.menu_pages.Subject;
import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MainActivity extends AppCompatActivity implements BottomNavigationView.OnNavigationItemSelectedListener, DialogInterface.OnClickListener {

    public final static String IP = "192.168.1.10";

    public final static String APP_URL = "http://" + IP + "/minniewiz-server/";
    //public final static String APP_URL = "https://minniewiz.000webhostapp.com/minniewiz-server/";
    public static String USER_ID = "";
    public static String SUBJECT_ID = "";

    private BottomNavigationView bottomNavigationView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bottomNavigationView = findViewById(R.id.bottomNavigation);
        bottomNavigationView.setOnNavigationItemSelectedListener(this);

        getSupportFragmentManager().beginTransaction().replace(R.id.fragmentContainer, new Subject()).commit();
    }

    @Override
    public void onBackPressed() {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        AlertDialog alertDialog = new AlertDialog.Builder(this)
                .setTitle("Log Out")
                .setMessage("Are you sure you want logout?")
                .setNegativeButton("No", null)
                .setPositiveButton("Yes", this)
                .show();
        alertDialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
        alertDialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getResources().getColor(R.color.secondary));
    }

    @Override
    public void onClick(DialogInterface dialog, int which) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        USER_ID = "";
        getSharedPreferences("LOGIN", MODE_PRIVATE).edit().putString("USER_ID", "").apply();
        startActivity(new Intent(this, Login.class));
        finish();
    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();

        Fragment selectedFragment = null;

        switch (item.getItemId()){
            case R.id.navHome:
                selectedFragment = new Subject();
                break;

            case R.id.navLeaderboard:
                selectedFragment = new Leaderboard();
                break;

            case R.id.navHistory:
                selectedFragment = new History();
                break;

            case R.id.navProfile:
                selectedFragment = new Profile();
                break;
        }

        getSupportFragmentManager().beginTransaction().replace(R.id.fragmentContainer, selectedFragment).commit();
        return true;
    }
}