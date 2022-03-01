package com.example.minniewiz.apdaters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.minniewiz.R;
import com.example.minniewiz.classes.Subject;

import java.util.ArrayList;

public class SubjectAdapter extends RecyclerView.Adapter<SubjectAdapter.ViewHolder>{

    private ArrayList<Subject> subjects;
    private OnSubjectClickListener onSubjectClickListener;
    private Context context;

    public SubjectAdapter(ArrayList<Subject> subjects, Context context, OnSubjectClickListener onSubjectClickListener){
        this.subjects = subjects;
        this.context = context;
        this.onSubjectClickListener = onSubjectClickListener;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.subject_item, parent, false);
        return new ViewHolder(view, onSubjectClickListener);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.txtSubject.setText(subjects.get(position).getName());
    }

    @Override
    public int getItemCount() {
        return subjects.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{

        private TextView txtSubject;
        private OnSubjectClickListener onSubjectClickListener;

        public ViewHolder(View itemView, OnSubjectClickListener onSubjectClickListener){
            super(itemView);
            txtSubject = itemView.findViewById(R.id.txtSubject);
            this.onSubjectClickListener = onSubjectClickListener;
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            onSubjectClickListener.onSubjectClick(getAdapterPosition());
        }
    }

    public interface OnSubjectClickListener{
        void onSubjectClick(int position);
    }

}
