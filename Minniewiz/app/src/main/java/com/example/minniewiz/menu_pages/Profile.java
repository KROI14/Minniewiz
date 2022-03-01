package com.example.minniewiz.menu_pages;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;
import com.example.minniewiz.MainActivity;
import com.example.minniewiz.R;
import com.mikhaellopez.circularimageview.CircularImageView;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Profile extends Fragment implements View.OnClickListener {

    private View contentView;

    private CircularImageView userImg;
    private TextView txtUserName, txtUserRank, txtUserAvg;
    private Button btnLogout;

    private GetUserData getUserData;
    private boolean isTaskRunning = false;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        contentView = inflater.inflate(R.layout.fragment_profile, container, false);

        userImg = contentView.findViewById(R.id.userImage);
        txtUserName = contentView.findViewById(R.id.userName);
        txtUserRank = contentView.findViewById(R.id.userRank);
        txtUserAvg = contentView.findViewById(R.id.userAvg);

        btnLogout = contentView.findViewById(R.id.btnLogout);
        btnLogout.setOnClickListener(this);

        if(!isTaskRunning){
            getUserData = new GetUserData();
            getUserData.execute();
        }

        return contentView;
    }

    @Override
    public void onClick(View v) {
        getActivity().onBackPressed();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        getUserData.cancel(true);
        isTaskRunning = false;
    }

    class GetUserData extends AsyncTask<Void, String, Void> implements Response.Listener<String>, Response.ErrorListener {

        private ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progress = new ProgressDialog(getContext());
            progress.setMessage("Loading...");
            progress.setCancelable(false);
            progress.show();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            String url = MainActivity.APP_URL + "android/get-user-profile.php";
            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String, String> user = new HashMap();
                    user.put("user-id", MainActivity.USER_ID);
                    return user;
                }
            };
            Volley.newRequestQueue(getContext()).add(stringRequest);

            return null;
        }

        @Override
        public void onResponse(String response) {
            try{
                JSONObject userObj = new JSONObject(response);
                String imgUrl = MainActivity.APP_URL + "user-uploads/" + userObj.getString("Image");
                String name = userObj.getString("Firstname") + " " + userObj.getString("Lastname");
                String rank = "n/a";
                String avg = "n/a";
                if(!userObj.getString("Rank").equals("false")){
                    avg = userObj.getString("Score");
                    rank = String.valueOf(userObj.getInt("Rank") + 1);
                }

                publishProgress(imgUrl, name, rank, avg);
            }
            catch (Exception e){
                Toast.makeText(getContext(), e.getMessage(), Toast.LENGTH_SHORT).show();
                publishProgress("");
            }
        }

        @Override
        public void onErrorResponse(VolleyError error) {
            Toast.makeText(getContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
            publishProgress("");
        }

        @Override
        protected void onProgressUpdate(String... values) {
            super.onProgressUpdate(values);
            progress.dismiss();
            if(!values[0].isEmpty()){
                Glide.with(Profile.this).load(values[0]).centerCrop().into(userImg);
                txtUserName.setText(values[1]);
                txtUserRank.setText(values[2]);
                txtUserAvg.setText(values[3]);
            }
        }
    }

}
