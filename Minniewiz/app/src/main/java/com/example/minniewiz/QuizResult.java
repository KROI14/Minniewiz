package com.example.minniewiz;


import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.AsyncTask;
import android.os.Bundle;

import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.apdaters.QuizResultAdapter;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

public class QuizResult extends AppCompatActivity {

    private RecyclerView recyclerView;
    private QuizResultAdapter resultAdapter;
    private ArrayList<com.example.minniewiz.classes.QuizResult> quizResults;

    private String levelID;

    private GetQuizResultTask quizResultTask;
    private boolean isTaskRunning = false;

    private TextView txtScore, txtTotalItems, txtSubjectLevelTitles;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz_result);

        txtScore = findViewById(R.id.score);
        txtTotalItems = findViewById(R.id.totalItems);
        txtSubjectLevelTitles = findViewById(R.id.subjectLevelTitles);

        recyclerView = findViewById(R.id.recyclerView);

        levelID = getIntent().getStringExtra("level-id");

        if(!isTaskRunning){
            quizResultTask = new GetQuizResultTask();
            quizResultTask.execute();
        }

        resultAdapter = new QuizResultAdapter(quizResults, this);
        recyclerView.setAdapter(resultAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        quizResultTask.cancel(true);
        isTaskRunning = false;
    }

    @Override
    public void onBackPressed() {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        startActivity(new Intent(QuizResult.this, Level.class));
        finish();
    }

    class GetQuizResultTask extends AsyncTask<Void, Void, Void> implements Response.Listener<String>, Response.ErrorListener {

        private ProgressDialog progress;

        private int score;
        private int totalItems;
        private String titles;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            quizResults = new ArrayList<>();

            progress = new ProgressDialog(QuizResult.this);
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            isTaskRunning = true;

            RequestQueue queue = Volley.newRequestQueue(QuizResult.this);
            String url = MainActivity.APP_URL + "/android/get-quiz-results.php";

            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("level-id", levelID);
                    data.put("user-id", MainActivity.USER_ID);

                    return data;
                }
            };
            queue.add(stringRequest);

            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONObject dataObj = new JSONObject(response);
                score = dataObj.getInt("Score");
                totalItems = new JSONArray(dataObj.getString("QuizResult")).length();
                titles = dataObj.getString("SubjectName") + " (" + dataObj.getString("LevelName") + ")";

                JSONArray quizRes = new JSONArray(dataObj.getString("QuizResult"));
                for(int i = 0; i < quizRes.length(); i++){
                    JSONObject quizObj = quizRes.getJSONObject(i);
                    String question = quizObj.getString("Question");

                    JSONArray images = new JSONArray(quizObj.getString("Images"));
                    String[] arrImg = new String[images.length()];
                    for(int j = 0; j < images.length(); j++){
                        arrImg[j] = images.getString(j);
                    }

                    JSONArray choices = new JSONArray(quizObj.getString("Choices"));
                    String[] arrChoices = new String[choices.length()];
                    for(int j = 0; j < choices.length(); j++){
                        arrChoices[j] = choices.getString(j);
                    }

                    String userAnswer = quizObj.getString("UserAnswer");
                    String correctAnswer = quizObj.getString("CorrectAnswer");

                    quizResults.add(new com.example.minniewiz.classes.QuizResult(question, arrImg, arrChoices, userAnswer, correctAnswer));
                }
            }
            catch(Exception e){
                Toast.makeText(QuizResult.this, e.getMessage(), Toast.LENGTH_SHORT).show();
            }

            publishProgress();
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(QuizResult.this, "", Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            super.onProgressUpdate(values);

            progress.dismiss();

            txtSubjectLevelTitles.setText(titles);
            txtScore.setText("" + score);
            txtTotalItems.setText("" + totalItems);

            resultAdapter.notifyDataSetChanged();

            isTaskRunning = false;
        }
    }
}