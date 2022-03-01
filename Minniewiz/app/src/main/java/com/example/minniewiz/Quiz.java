package com.example.minniewiz;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.classes.QuestionChoices;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class Quiz extends AppCompatActivity implements View.OnClickListener, DialogInterface.OnClickListener{

    private String levelID;

    private int indexPointer = 0;
    private Integer[] randomIndexes;
    private String[][] answers;

    private ImageView[] imgQuestions;
    private LinearLayout imgQuestionsLayout;

    private ImageView skipPrev, skipNext;
    private TextView txtQuestionCount, txtQuestion;
    private RadioGroup radioChoices;
    private RadioButton[] radioButtons;
    private Button btnSubmit;

    private boolean isGetQuestionTaskRunning = false;
    private GetQuestions getQuestions;

    private ArrayList<QuestionChoices> questionChoices;

    private AlertDialog.Builder dialogBuilder;
    private AlertDialog alertDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        initializeView();

        if(!isGetQuestionTaskRunning){
            getQuestions = new GetQuestions();
            getQuestions.execute();
        }
    }

    public void submit(){
        new SubmitTask().execute();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        getQuestions.cancel(true);
        isGetQuestionTaskRunning = false;
    }

    @Override
    public void onBackPressed() {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        if(questionChoices.size() > 0){
            dialogBuilder = new AlertDialog.Builder(this);
            dialogBuilder.setTitle("Submission");
            dialogBuilder.setMessage("We will submit your answers before you finish this set of questions. Are you sure you want to continue?");
            dialogBuilder.setPositiveButton("Yes", this);
            dialogBuilder.setNegativeButton("No", null);
            dialogBuilder.setCancelable(false);

            alertDialog = dialogBuilder.show();
            alertDialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
            alertDialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getResources().getColor(R.color.secondary));
        }
        else{
            super.onBackPressed();
            finish();
        }
    }

    @Override
    public void onClick(DialogInterface dialog, int which) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        submit();
    }

    @Override
    public void onClick(View v) {
        MediaPlayer.create(this, R.raw.snd_bubble).start();
        if(v == skipNext){
            saveAnswer(indexPointer);
            indexPointer = (indexPointer >= (questionChoices.size() - 1)) ? 0 : ++indexPointer;
            renderQuestionToViews(indexPointer);
        }
        else if(v == skipPrev){
            saveAnswer(indexPointer);
            indexPointer = (indexPointer <= 0) ? (questionChoices.size() - 1) : --indexPointer;
            renderQuestionToViews(indexPointer);
        }
        else if(v == btnSubmit){
            saveAnswer(indexPointer);
            dialogBuilder = new AlertDialog.Builder(this);
            dialogBuilder.setTitle("Submission");
            dialogBuilder.setMessage("Are you sure you want to submit your answers?");
            dialogBuilder.setPositiveButton("Yes", this);
            dialogBuilder.setNegativeButton("No", null);
            dialogBuilder.setCancelable(false);

            alertDialog = dialogBuilder.show();
            alertDialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
            alertDialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getResources().getColor(R.color.secondary));
        }
    }

    public void renderQuestionToViews(int pointer){
        int index = randomIndexes[pointer];

        txtQuestionCount.setText(((pointer + 1) + "/" + randomIndexes.length));

        //Question
        for(ImageView imgQuestion : imgQuestions){
            imgQuestion.setImageResource(0);
        }

        int imageCount = questionChoices.get(index).getImages().length;
        if(imageCount > 0) {
            imgQuestionsLayout.setVisibility(View.VISIBLE);
            for (int i = 0; i < imageCount; i++) {
                String imgUrl = MainActivity.APP_URL + "user-uploads/" + questionChoices.get(index).getImages()[i];
                Picasso.get().load(imgUrl).resize(700,700).error(R.drawable.img_error_placeholder).centerCrop().into(imgQuestions[i]);
            }

            //Hide Empty Image Views
            new Handler().postDelayed(() -> {
                for (ImageView imgQuestion : imgQuestions) {
                    if (imgQuestion.getDrawable() == null) {
                        imgQuestion.setVisibility(View.GONE);
                    }
                    else{
                        imgQuestion.setVisibility(View.VISIBLE);
                    }
                }
            }, 500);
        }
        else{
            imgQuestionsLayout.setVisibility(View.GONE);
        }
        txtQuestion.setText(questionChoices.get(index).getQuestion());

        //Choices and Retrieve Answers
        radioChoices.clearCheck();
        int choicesCount = radioButtons.length;
        for(int i = 0; i < choicesCount; i++){
            radioButtons[i].setText(questionChoices.get(index).getChoices()[i]);
            radioButtons[i].setChecked(radioButtons[i].getText().toString().equals(answers[pointer][1]));
        }
    }

    public void saveAnswer(int pointer){
        RadioButton rbAnswered = findViewById(radioChoices.getCheckedRadioButtonId());
        if(rbAnswered == null){
            answers[pointer][1] = "";
        }
        else{
            answers[pointer][1] = rbAnswered.getText().toString();
        }
    }

    public void initializeView(){
        levelID = getIntent().getExtras().getString("level-id");

        skipPrev = findViewById(R.id.skipPrev);
        skipNext = findViewById(R.id.skipNext);

        txtQuestionCount = findViewById(R.id.questionCount);

        imgQuestionsLayout = findViewById(R.id.imgQuestionLayout);
        imgQuestions = new ImageView[imgQuestionsLayout.getChildCount()];
        for(int i = 0; i < imgQuestionsLayout.getChildCount(); i++){
            if(imgQuestionsLayout.getChildAt(i) instanceof ImageView){
                imgQuestions[i] = (ImageView) imgQuestionsLayout.getChildAt(i);
            }
        }
        txtQuestion = findViewById(R.id.question);

        radioChoices = findViewById(R.id.choices);
        radioButtons = new RadioButton[radioChoices.getChildCount()];
        for(int i = 0; i < radioChoices.getChildCount(); i++){
            if(radioChoices.getChildAt(i) instanceof RadioButton){
                radioButtons[i] = (RadioButton) radioChoices.getChildAt(i);
            }
        }

        btnSubmit = findViewById(R.id.submit);

        btnSubmit.setOnClickListener(this);
        skipPrev.setOnClickListener(this);
        skipNext.setOnClickListener(this);
    }

    class SubmitTask extends AsyncTask<Void, String, Void> implements Response.Listener<String>, Response.ErrorListener, DialogInterface.OnClickListener{

        ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progress = new ProgressDialog(Quiz.this);
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            RequestQueue queue = Volley.newRequestQueue(Quiz.this);
            String url = MainActivity.APP_URL + "android/set-answer-results.php";
            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @RequiresApi(api = Build.VERSION_CODES.O)
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    int score = 0;
                    for(int i = 0; i < questionChoices.size(); i++){
                        if(answers[i][1].equals(questionChoices.get(randomIndexes[i]).getCorrect())){
                            score++;
                        }
                    }

                    Map<String, String> dataAnswer = new HashMap<>();
                    for(int i = 0; i < questionChoices.size(); i++){
                        dataAnswer.put(String.valueOf(i), String.join("|", answers[i]));
                    }

                    Map<String, String> data = new HashMap<>();
                    data.put("user-id", MainActivity.USER_ID);
                    data.put("level-id", levelID);
                    data.put("score", String.valueOf(score));
                    data.putAll(dataAnswer);

                    return data;
                }
            };
            queue.add(stringRequest);

            return null;
        }

        @Override
        public void onResponse(String response) {
            publishProgress(response);
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(Quiz.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress("error");
        }

        @Override
        protected void onProgressUpdate(String... values) {
            super.onProgressUpdate(values);
            if(values[0].contains("failed") || values[0].contains("error")){
                dialogBuilder = new AlertDialog.Builder(Quiz.this);
                dialogBuilder.setTitle("Failed");
                dialogBuilder.setMessage("The server has failed to record your answers. Try again later");
                dialogBuilder.setPositiveButton("Okay", this);
                dialogBuilder.setCancelable(false);

                alertDialog = dialogBuilder.show();
                alertDialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
            }
            else{
                startActivity(new Intent(Quiz.this, QuizResult.class).putExtra("level-id", levelID));
                finish();
            }
            progress.dismiss();
        }

        @Override
        public void onClick(DialogInterface dialog, int which) {
            startActivity(new Intent(Quiz.this, MainActivity.class));
            finish();
            alertDialog.dismiss();
        }
    }

    class GetQuestions extends AsyncTask<Void, Void, Void> implements Response.Listener<String>, Response.ErrorListener, DialogInterface.OnClickListener{

        ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            questionChoices = new ArrayList<>();

            progress = new ProgressDialog(Quiz.this);
            progress.setCancelable(false);
            progress.setMessage("Loading...");
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            RequestQueue queue = Volley.newRequestQueue(Quiz.this);
            String url = MainActivity.APP_URL + "android/get-questions.php";
            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("level-id", levelID);
                    return data;
                }
            };
            queue.add(stringRequest);

            return null;
        }

        @Override
        public void onResponse(String response) {
            try {
                JSONArray arrQuestions = new JSONArray(response);
                for(int i = 0; i < arrQuestions.length(); i++){
                    String questionID, question, answer;

                    JSONObject questionObj = arrQuestions.getJSONObject(i);
                    questionID = questionObj.getString("QuestionID");
                    question = questionObj.getString("Question");

                    JSONArray arrImages = new JSONArray(questionObj.getString("Images"));
                    String[] images = new String[arrImages.length()];
                    for(int j = 0; j < arrImages.length(); j++){
                        JSONObject imgObj = arrImages.getJSONObject(j);
                        images[j] = imgObj.getString("Image");
                    }

                    JSONArray arrChoices = new JSONArray(questionObj.getString("Choices"));
                    String[] choicesID = new String[arrChoices.length()];
                    String[] choices = new String[arrChoices.length()];
                    for(int j = 0; j < arrChoices.length(); j++){
                        JSONObject choiceObj = arrChoices.getJSONObject(j);
                        choicesID[j] = choiceObj.getString("ChoiceID");
                        choices[j] = choiceObj.getString("Choice");
                    }

                    JSONObject answerObj = questionObj.getJSONObject("Answer");
                    answer = answerObj.getString("Answer");

                    questionChoices.add(new QuestionChoices(questionID, question, images, choicesID, choices, answer));
                    isGetQuestionTaskRunning = true;
                }
                publishProgress();
            }
            catch (Exception e){
                Toast.makeText(Quiz.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress();
            }
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(Quiz.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            super.onProgressUpdate(values);
            progress.dismiss();
            if(questionChoices.size() > 0){
                shuffleIndexes();
                renderQuestionToViews(0);
                isGetQuestionTaskRunning = false;
            }
            else{
                dialogBuilder = new AlertDialog.Builder(Quiz.this);
                dialogBuilder.setTitle("Information");
                dialogBuilder.setMessage("There are no questions available. Try again next time");
                dialogBuilder.setIcon(R.drawable.ic_info);
                dialogBuilder.setPositiveButton("Okay", this);
                dialogBuilder.setCancelable(false);

                alertDialog = dialogBuilder.show();
                alertDialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getResources().getColor(R.color.secondary));
            }
        }

        @Override
        public void onClick(DialogInterface dialog, int which) {
            onBackPressed();
        }

        public void shuffleIndexes(){
            answers = new String[questionChoices.size()][2];
            randomIndexes = new Integer[questionChoices.size()];
            for(int i = 0; i < questionChoices.size(); i++){
                randomIndexes[i] = i;
            }
            List<Integer> indexList = Arrays.asList(randomIndexes);
            Collections.shuffle(indexList);
            indexList.toArray();

            for(int i = 0; i < questionChoices.size(); i++){
                answers[i][0] = questionChoices.get(randomIndexes[i]).getQuestionID();
                answers[i][1] = "";
            }
        }
    }
}