<?php

    class Delete extends Connection{

        public function dropUserAnswerByUserIDAndLevelID($userID, $levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('DELETE user_answers FROM user_answers INNER JOIN questions ON questions.QuestionID = user_answers.QuestionID WHERE user_answers.UserID = ? AND questions.LevelID = ?');
            $stmt->execute([$userID, $levelID]);
        }

        public function dropLevelScoreByUserIDAndLevelID($userID, $levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('DELETE FROM `level_score` WHERE UserID = ? AND LevelID = ?');
            return $stmt->execute([$userID, $levelID]);
        }

        public function dropQuestionByID($questionID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('DELETE FROM `questions` WHERE QuestionID = ?');
            return $stmt->execute([$questionID]);
        }

        public function dropLevelByID($levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('DELETE FROM levels WHERE LevelID = ?');
            return $stmt->execute([$levelID]);
        }

        public function dropSubjectByID($subjectID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare("DELETE FROM subjects WHERE SubjectID = ?");
            return $stmt->execute([$subjectID]);
        }

    }