package com.example.minniewiz.apdaters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.minniewiz.R;
import com.example.minniewiz.classes.LevelLogs;

import java.util.ArrayList;

public class LevelLogsAdapter extends RecyclerView.Adapter<LevelLogsAdapter.ViewHolder>{

    private ArrayList<LevelLogs> arrLogs;
    private Context context;

    public LevelLogsAdapter(Context context, ArrayList<LevelLogs> arrLogs){
        this.context = context;
        this.arrLogs = arrLogs;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.level_logs_items, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.txtDate.setText(arrLogs.get(position).getDateTaken());
        holder.txtName.setText(arrLogs.get(position).getLevelName());
        holder.txtScore.setText(arrLogs.get(position).getScore() + "");
        holder.txtItems.setText(arrLogs.get(position).getItems() + "");
    }

    @Override
    public int getItemCount() {
        return arrLogs.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtDate, txtName, txtScore, txtItems;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);

            txtDate = itemView.findViewById(R.id.dateTaken);
            txtName = itemView.findViewById(R.id.levelName);
            txtScore = itemView.findViewById(R.id.score);
            txtItems = itemView.findViewById(R.id.items);
        }
    }
}
