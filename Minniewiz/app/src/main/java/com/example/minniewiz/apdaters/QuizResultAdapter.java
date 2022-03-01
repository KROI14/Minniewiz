package com.example.minniewiz.apdaters;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.minniewiz.MainActivity;
import com.example.minniewiz.classes.QuizResult;
import com.example.minniewiz.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class QuizResultAdapter extends RecyclerView.Adapter<QuizResultAdapter.ViewHolder>{

    private ArrayList<QuizResult> quizResults;
    private Context context;
    private static final String TAG = "QuizResultAdapter";

    public QuizResultAdapter(ArrayList<QuizResult> quizResults, Context context){
        this.quizResults = quizResults;
        this.context = context;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.quiz_result_item, parent, false);
        return new ViewHolder(view);
    }


    @Override
    public void onBindViewHolder(@NonNull QuizResultAdapter.ViewHolder holder, int position) {
        int imgsLength = quizResults.get(position).getImgs().length;
        if(imgsLength > 0){
            holder.imgsLayout.setVisibility(View.VISIBLE);
            for(int i = 0; i < imgsLength; i++){
                String imgUrl = MainActivity.APP_URL + "user-uploads/" + quizResults.get(position).getImgs()[i];
                Picasso.get().load(imgUrl).resize(500,500).error(R.drawable.img_error_placeholder).centerCrop().into(holder.imgs[i]);
            }
        }
        else{
            holder.imgsLayout.setVisibility(View.GONE);
        }

        holder.txtQuestion.setText(quizResults.get(position).getQuestion());

        int choicesLength = holder.radioButtons.length;
        String correctAns = quizResults.get(position).getCorrectAnswer();
        String userAnswer = quizResults.get(position).getUserAnswer();

        for(int i = 0; i < choicesLength; i++){
            holder.radioButtons[i].setTextColor(Color.parseColor("#000000"));
        }

        for(int i = 0; i < choicesLength; i++){
            String choice = quizResults.get(position).getChoices()[i];
            holder.radioButtons[i].setText(choice);
            holder.radioButtons[i].setChecked(choice.equals(userAnswer));

            if(correctAns.equals(choice)) {
                holder.radioButtons[i].setTextColor(Color.parseColor("#12ff1a"));
            }

            if(!userAnswer.equals(correctAns) && userAnswer.equals(choice)) {
                holder.radioButtons[i].setTextColor(Color.parseColor("#b50000"));
            }
        }
    }

    @Override
    public int getItemCount() {
        return quizResults.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder{

        private LinearLayout imgsLayout;
        private ImageView[] imgs;

        private TextView txtQuestion;
        private RadioGroup radioChoices;
        private RadioButton[] radioButtons;

        public ViewHolder(View itemView){
            super(itemView);

            imgsLayout = itemView.findViewById(R.id.imagesLayout);
            imgs = new ImageView[imgsLayout.getChildCount()];
            for(int i = 0; i < imgsLayout.getChildCount(); i++){
                imgs[i] = (ImageView)imgsLayout.getChildAt(i);
            }

            txtQuestion = itemView.findViewById(R.id.question);

            radioChoices = itemView.findViewById(R.id.choices);
            radioButtons = new RadioButton[radioChoices.getChildCount()];
            for(int i = 0; i < radioChoices.getChildCount(); i++){
                radioButtons[i] = (RadioButton) radioChoices.getChildAt(i);
                radioButtons[i].setEnabled(false);
            }
        }

    }

}
