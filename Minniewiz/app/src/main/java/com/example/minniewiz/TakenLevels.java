package com.example.minniewiz;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.apdaters.LevelLogsAdapter;
import com.example.minniewiz.classes.LevelLogs;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TakenLevels extends AppCompatActivity {

    private RecyclerView recyclerView;
    private LevelLogsAdapter logsAdapter;
    private ArrayList<LevelLogs> arrLogs;

    private boolean isTaskRunning = false;
    private GetLogs getLogs;

    private TextView txtSubjName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_taken_levels);

        txtSubjName = findViewById(R.id.subjectName);
        txtSubjName.setText(getIntent().getExtras().getString("subject-name") + " Quiz History");

        if(!isTaskRunning){
            getLogs = new GetLogs();
            getLogs.execute();
        }
        recyclerView = findViewById(R.id.recyclerView);
        logsAdapter = new LevelLogsAdapter(this, arrLogs);

        recyclerView.setAdapter(logsAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        getLogs.cancel(true);
        isTaskRunning = false;
    }

    class GetLogs extends AsyncTask<Void, Void, Void> implements Response.Listener<String>, Response.ErrorListener {

        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            arrLogs = new ArrayList<>();

            progress = new ProgressDialog(TakenLevels.this);
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            isTaskRunning = true;
            String url = MainActivity.APP_URL + "android/get-taken-levels.php";
            StringRequest request = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap<>();
                    data.put("user-id", MainActivity.USER_ID);
                    data.put("subject-id", MainActivity.SUBJECT_ID);
                    return data;
                }
            };
            Volley.newRequestQueue(TakenLevels.this).add(request);
            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONArray arr = new JSONArray(response);
                for(int i = 0; i < arr.length(); i++){
                    JSONObject obj = arr.getJSONObject(i);
                    arrLogs.add(new LevelLogs(obj.getString("CreatedAt"), obj.getString("Name"), obj.getInt("Score"), obj.getInt("Items")));
                }
            }
            catch(Exception e){
                Toast.makeText(TakenLevels.this, e.getMessage(), Toast.LENGTH_SHORT).show();
            }
            publishProgress();
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(TakenLevels.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            super.onProgressUpdate(values);
            progress.dismiss();
            isTaskRunning = false;
            logsAdapter.notifyDataSetChanged();
        }
    }
}