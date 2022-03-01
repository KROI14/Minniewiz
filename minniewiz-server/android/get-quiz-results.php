<?php

    include '../includes/class-loader.php';
    $selectObj = new Select();
    
    $levelScore = $selectObj->getLevelScoreByLevelIDAndUserID($_POST['level-id'], $_POST['user-id']);

    $level = $selectObj->getLevelByLevelID($_POST['level-id']);
    $subject = $selectObj->getSubjectByID($level->SubjectID);
    $levelScore->SubjectName = $subject->Title;
    $levelScore->LevelName = $level->Name;
    
    $questionCount = $selectObj->getQuestionCountByLevelID($_POST['level-id']);
    $userAnswer = $selectObj->getUserAnswersByUserIDAndLevelID($_POST['user-id'], $_POST['level-id'], $questionCount);
    $userAnswer = json_decode(json_encode($userAnswer),  true);

    $dataArray = [];

    for($i = 0; $i < count($userAnswer); $i++){
        $questionData = $selectObj->getQuestionByQuestionID($userAnswer[$i]['QuestionID']);

        $questionImg = $selectObj->getQuestionImagesByQuestionID($userAnswer[$i]['QuestionID']);
        $arrImg = [];
        foreach($questionImg as $qImg){
            array_push($arrImg, $qImg->Image);
        }

        $choices = $selectObj->getChoicesByQuestionID($userAnswer[$i]['QuestionID']);
        $arrChoices = [];
        foreach($choices as $choice){
            array_push($arrChoices, $choice->Choice);
        }
        
        $correctAns = "";
        $uAnswer = $selectObj->getChoiceByChoiceID($userAnswer[$i]['ChoiceID'])->Choice;
        if(strlen($uAnswer) > 0){
            $correctAns = $selectObj->getAnswerByQuestionID($userAnswer[$i]['QuestionID'])->Answer;
        }
        
        array_push($dataArray, array(
            "Question" => $questionData->Question,
            "Images" => $arrImg,
            "Choices" => $arrChoices,
            "UserAnswer" => $uAnswer,
            "CorrectAnswer" => $correctAns
        ));
    }
        
    $dataArray = array_merge(array("QuizResult" => $dataArray), json_decode(json_encode($levelScore),  true));
    
    echo json_encode($dataArray);