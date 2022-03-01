package com.example.minniewiz.menu_pages;

import android.app.ProgressDialog;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.MainActivity;
import com.example.minniewiz.R;
import com.example.minniewiz.TakenLevels;
import com.example.minniewiz.apdaters.SubjectAdapter;
import com.example.minniewiz.classes.Subject;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class History extends Fragment implements SubjectAdapter.OnSubjectClickListener{

    private View contentView;

    private GetTakenSubjects getTakenSubjects;
    private boolean isTaskRunning = false;

    private RecyclerView recyclerView;
    private ArrayList<Subject> subjectArr;
    private SubjectAdapter subjectAdapter;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        contentView = inflater.inflate(R.layout.fragment_history, container, false);

        recyclerView = contentView.findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        if(!isTaskRunning){
            getTakenSubjects = new GetTakenSubjects();
            getTakenSubjects.execute();
        }

        subjectAdapter = new SubjectAdapter(subjectArr, getContext(), this);
        recyclerView.setAdapter(subjectAdapter);

        return contentView;
    }

    @Override
    public void onSubjectClick(int position) {
        MediaPlayer.create(getContext(), R.raw.snd_bubble).start();
        MainActivity.SUBJECT_ID = subjectArr.get(position).getSubjectID();
        String subjectName = subjectArr.get(position).getName();

        startActivity(new Intent(getContext(), TakenLevels.class).putExtra("subject-name", subjectName));
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        isTaskRunning = false;
        getTakenSubjects.cancel(true);
    }

    class GetTakenSubjects extends AsyncTask<Void, Void, Void> implements Response.Listener<String>, Response.ErrorListener {
        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            subjectArr = new ArrayList<>();
            progress = new ProgressDialog(getContext());
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            isTaskRunning = true;
            String url = MainActivity.APP_URL + "android/get-subject-taken.php";
            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> data = new HashMap();
                    data.put("user-id", MainActivity.USER_ID);
                    return data;
                }
            };
            Volley.newRequestQueue(getActivity()).add(stringRequest);

            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONArray subjectJsonArr = new JSONArray(response);
                for(int i = 0; i < subjectJsonArr.length(); i++){
                    JSONObject subjectObj = subjectJsonArr.getJSONObject(i);
                    subjectArr.add(new Subject(subjectObj.getString("SubjectID"), subjectObj.getString("Title")));
                }
                publishProgress();
            }
            catch(Exception e){
                Toast.makeText(getContext(), e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress();
            }

        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(getActivity(), error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            super.onProgressUpdate(values);
            progress.dismiss();
            subjectAdapter.notifyDataSetChanged();
            isTaskRunning = false;
        }
    }
}
