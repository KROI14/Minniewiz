package com.example.minniewiz.menu_pages;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;
import com.example.minniewiz.MainActivity;
import com.example.minniewiz.R;
import com.example.minniewiz.apdaters.LeaderboardAdapter;
import com.mikhaellopez.circularimageview.CircularImageView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

public class Leaderboard extends Fragment {

    private View contentView;
    private RecyclerView recyclerView;
    private LeaderboardAdapter leaderboardAdapter;
    private ArrayList<com.example.minniewiz.classes.Leaderboard> arrLeaderboard;

    private GetLeaderboard getLeaderboard;
    private boolean isTaskRunning = false;

    private CircularImageView topUserImg;
    private TextView txtTopUserName, txtTopUserScore, txtTopRank;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        contentView = inflater.inflate(R.layout.fragment_leaderboard, container, false);

        topUserImg = contentView.findViewById(R.id.topUserImg);
        txtTopUserName = contentView.findViewById(R.id.topUserName);
        txtTopUserScore = contentView.findViewById(R.id.topUserScore);
        txtTopRank = contentView.findViewById(R.id.topRank);

        if(!isTaskRunning){
            getLeaderboard = new GetLeaderboard();
            getLeaderboard.execute();
        }

        leaderboardAdapter = new LeaderboardAdapter(getContext(), arrLeaderboard);
        recyclerView = contentView.findViewById(R.id.recyclerView);

        recyclerView.setAdapter(leaderboardAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        return contentView;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        getLeaderboard.cancel(true);
        isTaskRunning = false;
    }

    class GetLeaderboard extends AsyncTask<Void, com.example.minniewiz.classes.Leaderboard, Void> implements Response.Listener<String>, Response.ErrorListener {
        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            arrLeaderboard = new ArrayList<>();
            progress = new ProgressDialog(getContext());
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            String url = MainActivity.APP_URL + "android/get-rankings.php";
            StringRequest request = new StringRequest(url, this, this);
            RequestQueue requestQueue = Volley.newRequestQueue(getContext());
            requestQueue.add(request);

            isTaskRunning = true;

            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONArray users = new JSONArray(response);
                if(users.length() > 0){
                    for(int i = 1; i < users.length(); i++){
                        JSONObject userObj = users.getJSONObject(i);
                        arrLeaderboard.add(new com.example.minniewiz.classes.Leaderboard(
                                i + 1,
                                userObj.getString("Firstname") + " " + userObj.getString("Lastname"),
                                userObj.getString("UserID"),
                                (float)userObj.getDouble("Score"),
                                userObj.getString("Image")));
                    }
                    publishProgress(
                            new com.example.minniewiz.classes.Leaderboard(
                                    1,
                                    users.getJSONObject(0).getString("Firstname") + " " + users.getJSONObject(0).getString("Lastname"),
                                    users.getJSONObject(0).getString("UserID"),
                                    (float)users.getJSONObject(0).getDouble("Score"),
                                    users.getJSONObject(0).getString("Image")
                            ));
                }
                else{
                    publishProgress(null);
                }
            }
            catch(Exception e){
                Toast.makeText(getContext(), e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress(null);
            }
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(getContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress(null);
        }

        @Override
        protected void onProgressUpdate(com.example.minniewiz.classes.Leaderboard... values) {
            super.onProgressUpdate(values);
            progress.dismiss();

            if(values != null){
                String imgUrl = MainActivity.APP_URL + "user-uploads/" + values[0].getImgUser();
                Glide.with(Leaderboard.this).load(imgUrl).centerCrop().into(topUserImg);
                txtTopRank.setText("#" + values[0].getRank());
                txtTopUserName.setText(values[0].getUserName());
                txtTopUserScore.setText(String.format("%.2f", values[0].getUserScore()));
            }

            leaderboardAdapter.notifyDataSetChanged();
        }
    }
}
