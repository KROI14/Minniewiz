<?php

    class Select extends Connection{

        //Level Scores
        public function getTakenLevelsByUserIDAndSubjectID($userID, $subjectID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `level_score` INNER JOIN levels ON levels.LevelID = level_score.LevelID WHERE UserID = ? AND levels.SubjectID = ? ORDER BY CreatedAt');
            $stmt->execute([$userID, $subjectID]);
            $levels = $stmt->fetchAll();

            return $levels;
        }

        public function getUserLevelScoreByUserID($userID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT users.UserID, Firstname, Lastname, Image, AVG(Score) as Score FROM `level_score` INNER JOIN users ON users.UserID = level_score.UserID WHERE users.UserID = ? AND ScoreID IN (SELECT MAX(ScoreID) FROM level_score WHERE UserID = ? GROUP BY LevelID)');
            $stmt->execute([$userID, $userID]);
            $scores = $stmt->fetch();

            return $scores;
        }

        public function getLevelScoreByLevelIDAndUserID($levelID, $userID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare("SELECT * FROM `level_score` WHERE LevelID = ? AND UserID = ? ORDER BY CreatedAt DESC");
            $stmt->execute([$levelID, $userID]);
            $levelScore = $stmt->fetch();
            return $levelScore;
        }

        //Users
        public function getUserByUserID($userID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM users WHERE UserID = ?');
            $stmt->execute([$userID]);
            $user = $stmt->fetch();

            return $user;
        }

        public function getUsers(){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM users WHERE UserID != "U-0000"');
            $stmt->execute();
            $users = $stmt->fetchAll();

            return $users;
        }
        
        public function getUserByUsernameAndPassword($username, $password){
            $pdo = $this->connect();

            $stmt = $pdo->prepare("SELECT * FROM `users` WHERE Username = ? AND Password = ?");
            $stmt->execute([$username, $password]);
            $user = $stmt->fetch();

            return $user;
        }
        
        public function getUserByUsername($username){
            $pdo = $this->connect();
            
            $stmt = $pdo->prepare("SELECT * FROM users WHERE Username = ?");
            $stmt->execute([$username]);
            $user = $stmt->fetchAll();
            
            return $user;
        }

        //Answer
        public function getUserAnswersByUserIDAndLevelID($userID, $levelID, $questionCount){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `user_answers` INNER JOIN questions ON questions.QuestionID = user_answers.QuestionID WHERE user_answers.UserID = ? AND questions.LevelID = ? ORDER BY DateAnswered DESC LIMIT ?');
            $stmt->bindParam(1, $userID);
            $stmt->bindParam(2, $levelID);
            $stmt->bindParam(3, $questionCount, PDO::PARAM_INT);
            $stmt->execute();
            $quizzes = $stmt->fetchAll();

            return $quizzes;
        }

        public function getAnswerByQuestionID($questionID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `answers` WHERE QuestionID = ?');
            $stmt->execute([$questionID]);
            $answer = $stmt->fetch();

            return $answer;
        }

        //Choices
        public function getChoiceIDByQuestionIDAndChoice($questionID, $choice){
            $pdo = $this->connect();

            $stmt = $pdo->prepare("SELECT * FROM `choices` WHERE QuestionID = ? AND Choice = ?");
            $stmt->execute([$questionID, $choice]);
            $choiceID = $stmt->fetch();

            return $choiceID;
        }

        public function getChoiceByChoiceID($choiceID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `choices` WHERE ChoiceID = ?');
            $stmt->execute([$choiceID]);
            $choice = $stmt->fetch();

            return $choice;
        }

        public function getChoicesByQuestionID($questionID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `choices` WHERE QuestionID = ?');
            $stmt->execute([$questionID]);
            $choices = $stmt->fetchAll();

            return $choices;
        }

        //Question
        public function getQuestionImagesByQuestionID($questionID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `question_images` WHERE QuestionID = ?');
            $stmt->execute([$questionID]);
            $images = $stmt->fetchAll();
            
            return $images;
        }

        public function getQuestionByQuestionID($questionID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `questions` WHERE QuestionID = ?');
            $stmt->execute([$questionID]);
            $question = $stmt->fetch();

            return $question;
        }

        public function getQuestionsByLevelID($levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `questions` WHERE LevelID = ?');
            $stmt->execute([$levelID]);
            $questions = $stmt->fetchAll();

            return $questions;
        }

        public function getQuestionCountByLevelID($levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `questions` WHERE LevelID = ?');
            $stmt->execute([$levelID]);
            
            return $stmt->rowCount();
        }

        //Levels
        public function getLevelByLevelID($levelID){
            $pdo = $this->connect();
            
            $stmt = $pdo->prepare('SELECT * FROM levels WHERE LevelID = ?');
            $stmt->execute([$levelID]);
            $level = $stmt->fetch();

            return $level;
        }

        public function getLevels(){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM levels WHERE LevelID != "LV-0000"');
            $stmt->execute();
            $levels = $stmt->fetchAll();

            return $levels;
        }

        public function getLevelBySubjectIDName($subjectID, $name){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `levels` WHERE SubjectID = ? AND Name = ?');
            $stmt->execute([$subjectID, $name]);
            $level = $stmt->fetch();

            return $level;
        }

        public function getLevelBySubjectIDAndLevelID($subjectID, $levelID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM `levels` WHERE LevelID = ? AND SubjectID = ?');
            $stmt->execute([$levelID, $subjectID]);
            $level = $stmt->fetch();

            return $level;
        }

        public function getLevelsBySubjectID($subjectID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM levels WHERE SubjectID = ?');
            $stmt->execute([$subjectID]);
            $levels = $stmt->fetchAll();

            return $levels;
        }

        //Subject
        public function getTakenSubjectsByUserID($userID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM level_score INNER JOIN levels ON levels.LevelID = level_score.LevelID WHERE UserID = ? GROUP BY SubjectID');
            $stmt->execute([$userID]);
            $subjects = $stmt->fetchAll();

            return $subjects;
        }

        public function getSubjectByID($subjectID){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM subjects WHERE SubjectID = ?');
            $stmt->execute([$subjectID]);
            $subject = $stmt->fetch();

            return $subject;
        }

        public function getSubjectByTitle($title){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('SELECT * FROM subjects WHERE Title = ?');
            $stmt->execute([$title]);
            $subject = $stmt->fetch();

            return $subject;
        }

        public function getSubjects(){
            $pdo = $this->connect();
            
            $stmt = $pdo->prepare('SELECT * FROM subjects WHERE SubjectID > :startID');
            $stmt->execute(['startID' => "SUB-0000"]);
            $subjects = $stmt->fetchAll();
            
            return $subjects;
        }

        public function getIncrementedID($tableName, $columnName){
            $pdo = $this->connect();

            $stmt = $pdo->query("SELECT $columnName FROM $tableName ORDER BY $columnName DESC LIMIT 1");
            $id = $stmt->fetch(PDO::FETCH_ASSOC)[$columnName];
            
            $int = preg_replace('/[^0-9]/', '', $id);
            $str = preg_replace('/\d/', '', $id);
            //Increment extracted integer
            $int = str_pad(++$int, 4, "0", STR_PAD_LEFT);
            
            return $str . $int;
        }

    }