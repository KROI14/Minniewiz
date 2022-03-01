<?php

    class Insert extends Connection{

        public function setUserAnswer($answerID, $userID, $questionID, $choiceID){
            $pdo = $this->connect();

            date_default_timezone_set('Asia/Manila');
            $createdAt = date("Y-m-d H:i:s");

            $stmt = $pdo->prepare("INSERT INTO `user_answers`(`AnswerID`, `UserID`, `QuestionID`, `ChoiceID`, `DateAnswered`) VALUES (?, ?, ?, ?, ?)");
            $isInserted = $stmt->execute([$answerID, $userID, $questionID, $choiceID, $createdAt]);

            return $isInserted;
        }
        
        public function setLevelScore($scoreID, $userID, $levelID, $score){
            $pdo = $this->connect();
            
            date_default_timezone_set('Asia/Manila');
            $createdAt = date("Y-m-d H:i:s");
            
            $stmt = $pdo->prepare("INSERT INTO `level_score`(`ScoreID`, `UserID`, `LevelID`, `Score`, `CreatedAt`) VALUES (?, ?, ?, ?, ?)");
            $isInserted = $stmt->execute([$scoreID, $userID, $levelID, $score, $createdAt]);
            
            return $isInserted;
        }

        public function setAnswer($questionID, $answer){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO `answers`(`QuestionID`, `Answer`) VALUES (?, ?)');
            $isInserted = $stmt->execute([$questionID, $answer]);
            
            return $isInserted;
        }

        public function setChoices($choiceID, $questionID, $choice){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO `choices`(`ChoiceID`, `QuestionID`, `Choice`) VALUES (?, ?, ?)');
            $isInserted = $stmt->execute([$choiceID, $questionID, $choice]);

            return $isInserted;
        }

        public function setQuestionImage($imgID, $questionID, $img){
            $pdo = $this->connect();
            
            $stmt = $pdo->prepare('INSERT INTO `question_images`(`ImageID`, `QuestionID`, `Image`) VALUES (?, ?, ?)');
            $isInserted = $stmt->execute([$imgID, $questionID, $img]);

            return $isInserted;
        }

        public function setQuestion($questionID, $levelID, $question){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO `questions`(`QuestionID`, `LevelID`, `Question`) VALUES (?, ?, ?)');
            $isInserted = $stmt->execute([$questionID, $levelID, $question]);
            
            return $isInserted;
        }

        public function setLevel($levelID, $subjectID, $name, $duration){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO `levels`(`LevelID`, `SubjectID`, `Name`, `Duration`) VALUES (?, ?, ?, ?)');
            $isInserted = $stmt->execute([$levelID, $subjectID, $name, $duration]);
            
            return $isInserted;
        }

        public function setSubject($subjectID, $subjectTitle){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO subjects VALUES(?, ?)');
            $isInserted = $stmt->execute([$subjectID, $subjectTitle]);

            return $isInserted;
        }

        public function setUser($userID, $fName, $lName, $username, $password, $img){
            $pdo = $this->connect();

            $stmt = $pdo->prepare('INSERT INTO `users`(`UserID`, `Firstname`, `Lastname`, `Username`, `Password`, `Image`) VALUES (?, ?, ?, ?, ?, ?)');
            $isInserted = $stmt->execute([$userID, $fName, $lName, $username, $password, $img]);

            return $isInserted;
        }

    }