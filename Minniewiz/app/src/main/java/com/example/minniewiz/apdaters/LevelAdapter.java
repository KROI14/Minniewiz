package com.example.minniewiz.apdaters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.minniewiz.R;
import com.example.minniewiz.classes.Level;

import java.util.ArrayList;

public class LevelAdapter extends RecyclerView.Adapter<LevelAdapter.ViewHolder> {

    private ArrayList<Level> levels;
    private Context context;
    private OnLevelItemListener onLevelItemListener;

    public LevelAdapter(ArrayList<Level> levels, Context context, OnLevelItemListener onLevelItemListener){
        this.levels = levels;
        this.context = context;
        this.onLevelItemListener = onLevelItemListener;
    }

    @NonNull
    @Override
    public LevelAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.level_item, parent, false);
        return new ViewHolder(view, onLevelItemListener);
    }

    @Override
    public void onBindViewHolder(@NonNull LevelAdapter.ViewHolder holder, int position) {
        holder.txtLevel.setText(levels.get(position).getName());

        int min = ((int)levels.get(position).getTimeDuration() / 1000) / 60;
        int sec = ((int)(levels.get(position).getTimeDuration() / 1000) % 60);

        if(levels.get(position).isLocked()){
            holder.imgLockIcon.setVisibility(View.VISIBLE);
        }
        else{
            holder.imgLockIcon.setVisibility(View.GONE);
        }
    }

    @Override
    public int getItemCount() {
        return levels.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{

        private TextView txtLevel;
        private ImageView imgLockIcon;
        private OnLevelItemListener onLevelItemListener;

        public ViewHolder(@NonNull View itemView, OnLevelItemListener onLevelItemListener) {
            super(itemView);

            txtLevel = itemView.findViewById(R.id.txtLevel);
            imgLockIcon = itemView.findViewById(R.id.imgLockIcon);
            this.onLevelItemListener = onLevelItemListener;

            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            onLevelItemListener.onLevelClick(getAdapterPosition());
        }
    }

    public interface OnLevelItemListener{
        void onLevelClick(int position);
    }
}
