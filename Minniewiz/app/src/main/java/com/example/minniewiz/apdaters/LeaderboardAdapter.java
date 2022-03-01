package com.example.minniewiz.apdaters;

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.minniewiz.MainActivity;
import com.example.minniewiz.R;
import com.example.minniewiz.classes.Leaderboard;
import com.mikhaellopez.circularimageview.CircularImageView;

import java.util.ArrayList;

public class LeaderboardAdapter extends RecyclerView.Adapter<LeaderboardAdapter.ViewHolder>{

    private Context context;
    private ArrayList<Leaderboard> arrLeaderboard;

    public LeaderboardAdapter(Context context, ArrayList<Leaderboard> arrLeaderboard){
        this.context = context;
        this.arrLeaderboard = arrLeaderboard;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.leaderboard_item, parent, false);
        return new ViewHolder(view);
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.txtUserRank.setText("#" + arrLeaderboard.get(position).getRank());
        holder.txtUserName.setText(arrLeaderboard.get(position).getUserName());
        holder.txtUserScore.setText(String.format("%.2f", arrLeaderboard.get(position).getUserScore()));

        String imgUrl = MainActivity.APP_URL + "user-uploads/" + arrLeaderboard.get(position).getImgUser();
        Glide.with(context).load(imgUrl).centerCrop().into(holder.imgUser);

        holder.imgUser.setBorderColor(Color.parseColor("#ffffff"));
        holder.txtUserName.setTypeface(context.getResources().getFont(R.font.noto_sans_regular));
        holder.txtUserScore.setTypeface(context.getResources().getFont(R.font.noto_sans_regular));

        if(MainActivity.USER_ID.equals(arrLeaderboard.get(position).getUserID())){
            holder.imgUser.setBorderColor(Color.parseColor("#ffbd08"));
            holder.txtUserName.setTypeface(context.getResources().getFont(R.font.noto_sans_bold));
            holder.txtUserScore.setTypeface(context.getResources().getFont(R.font.noto_sans_bold));
        }
    }

    @Override
    public int getItemCount() {
        return arrLeaderboard.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtUserRank, txtUserName, txtUserScore;
        private CircularImageView imgUser;

        public ViewHolder(View itemView){
            super(itemView);

            txtUserRank = itemView.findViewById(R.id.userRank);
            txtUserName = itemView.findViewById(R.id.userName);
            txtUserScore = itemView.findViewById(R.id.userScore);
            imgUser = itemView.findViewById(R.id.userImage);
        }
    }
}
