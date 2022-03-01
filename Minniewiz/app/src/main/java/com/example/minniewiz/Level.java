package com.example.minniewiz;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.apdaters.LevelAdapter;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Level extends AppCompatActivity implements LevelAdapter.OnLevelItemListener, View.OnClickListener{

    private String levelID;
    private long timeDuration;

    private ArrayList<com.example.minniewiz.classes.Level> levels;

    private LevelAdapter adapter;

    private GetLevelsTask getLevels;
    private Boolean isTaskRunning = false;

    private Button btnCancel, btnPrevResults, btnStart;
    private AlertDialog alertDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_level);

        String subjectID = MainActivity.SUBJECT_ID;

        if(!isTaskRunning){
            getLevels = new GetLevelsTask();
            getLevels.execute(subjectID, MainActivity.USER_ID);
        }

        adapter = new LevelAdapter(levels, this, this);
        RecyclerView recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    public void onLevelClick(int position) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();

        levelID = levels.get(position).getLevelID();
        timeDuration = levels.get(position).getTimeDuration();

        if(!levels.get(position).isLocked()){
            View dialogView = getLayoutInflater().inflate(R.layout.custom_dialog, null);

            TextView txtMessage = dialogView.findViewById(R.id.message);
            btnCancel = dialogView.findViewById(R.id.cancel);
            btnPrevResults = dialogView.findViewById(R.id.prevResults);
            btnStart = dialogView.findViewById(R.id.start);

            txtMessage.setText(("You are about to take " + levels.get(position).getName() + " quiz. Press start button to continue"));
            if(levels.get(position).isTaken()){
                btnPrevResults.setVisibility(View.VISIBLE);
            }
            else{
                btnPrevResults.setVisibility(View.GONE);
            }

            btnCancel.setOnClickListener(this);
            btnPrevResults.setOnClickListener(this);
            btnStart.setOnClickListener(this);

            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setView(dialogView);

            alertDialog = builder.create();
            alertDialog.setIcon(R.drawable.ic_warning);
            alertDialog.setTitle("Warning");
            alertDialog.setCanceledOnTouchOutside(false);
            alertDialog.show();
        }
    }

    @Override
    public void onClick(View v) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();

        if(v == btnCancel){
            alertDialog.dismiss();
        }
        else if(v == btnPrevResults){
            startActivity(new Intent(Level.this, QuizResult.class).putExtra("level-id", levelID));
            finish();
            alertDialog.dismiss();
        }
        else if(v == btnStart){
            Intent intent = new Intent(this, Quiz.class);
            intent.putExtra("level-id", levelID);
            intent.putExtra("time-duration", timeDuration);
            alertDialog.dismiss();
            startActivity(intent);
            finish();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        getLevels.cancel(true);
        isTaskRunning = false;
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        MainActivity.SUBJECT_ID = "";
    }

    class GetLevelsTask extends AsyncTask<String, Void, Void> implements Response.Listener<String>, Response.ErrorListener {
        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            levels = new ArrayList<>();

            progress = new ProgressDialog(Level.this);
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(String... voids) {
            RequestQueue requestQueue = Volley.newRequestQueue(Level.this);
            String url = MainActivity.APP_URL + "android/get-levels.php";

            StringRequest request = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("subject-id", voids[0]);
                    data.put("user-id", voids[1]);
                    return data;
                }
            };
            requestQueue.add(request);

            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONArray jsonArr = new JSONArray(response);
                for(int i = 0; i < jsonArr.length(); i++){
                    JSONObject jsonObj = jsonArr.getJSONObject(i);
                    levels.add(new com.example.minniewiz.classes.Level(jsonObj.getString("LevelID"), jsonObj.getString("Name"), jsonObj.getLong("Duration"), jsonObj.getBoolean("IsTaken"), jsonObj.getBoolean("IsLocked")));
                }
                publishProgress();
            }
            catch (Exception e){
                Toast.makeText(Level.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress();
            }
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(Level.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            super.onProgressUpdate(values);
            progress.dismiss();
            adapter.notifyDataSetChanged();
            isTaskRunning = true;
        }

        @Override
        protected void onPostExecute(Void unused) {
            super.onPostExecute(unused);
            isTaskRunning = false;
        }
    }
}