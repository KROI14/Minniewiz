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
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minniewiz.Level;
import com.example.minniewiz.MainActivity;
import com.example.minniewiz.R;
import com.example.minniewiz.apdaters.SubjectAdapter;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

public class Subject extends Fragment implements SubjectAdapter.OnSubjectClickListener{

    private View contentView;

    private ArrayList<com.example.minniewiz.classes.Subject> subjects;
    private SubjectAdapter adapter;

    private GetSubjectsTask getSubjectTask;
    private Boolean isTaskRunning = false;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        contentView = inflater.inflate(R.layout.fragment_subject, container, false);

        if(!isTaskRunning){
            getSubjectTask = new GetSubjectsTask();
            getSubjectTask.execute();
        }

        adapter = new SubjectAdapter(subjects, getContext(), this);
        RecyclerView recyclerView = contentView.findViewById(R.id.recyclerView);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new GridLayoutManager(getContext(), 2));

        return contentView;
    }


    @Override
    public void onSubjectClick(int position) {
        MediaPlayer.create(getContext(), R.raw.snd_bubble).start();
        String subjectID = subjects.get(position).getSubjectID();
        MainActivity.SUBJECT_ID = subjectID;
        startActivity(new Intent(getContext(), Level.class));
    }


    @Override
    public void onStop() {
        super.onStop();
        getSubjectTask.cancel(true);
        isTaskRunning = false;
    }

    class GetSubjectsTask extends AsyncTask<Void, Void, Void> implements Response.Listener<String>, Response.ErrorListener{

        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            subjects = new ArrayList<>();
            progress = new ProgressDialog(getContext());
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            RequestQueue requestQueue = Volley.newRequestQueue(getContext());
            String url = MainActivity.APP_URL + "android/get-subjects.php";

            StringRequest request = new StringRequest(Request.Method.POST, url, this, this);
            requestQueue.add(request);

            return null;
        }

        @Override
        public void onResponse(String response){
            try{
                JSONArray array = new JSONArray(response);
                for(int i = 0; i < array.length(); i++){
                    JSONObject object = array.getJSONObject(i);
                    subjects.add(new com.example.minniewiz.classes.Subject(object.getString("SubjectID"), object.getString("Title")));
                }
                publishProgress();
            }
            catch (Exception e){
                Toast.makeText(getContext(), e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress();
            }
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(getContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress();
        }

        @Override
        protected void onProgressUpdate(Void... values) {
            progress.dismiss();
            adapter.notifyDataSetChanged();
            isTaskRunning = true;
        }

        @Override
        protected void onPostExecute(Void unused) {
            isTaskRunning = false;
        }
    }
}
