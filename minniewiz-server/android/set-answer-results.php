<?php

    include '../includes/class-loader.php';
    $selectObj = new Select();
    $insertObj = new Insert();

    $result = [];
    
    $scoreID = $selectObj->getIncrementedID("level_score", "ScoreID");
    $isInserted = $insertObj->setLevelScore($scoreID, $_POST['user-id'], $_POST['level-id'], $_POST['score']);
    array_push($result, $isInserted);

    $questionIndexes = [];
    for($i = 0; $i < count($_POST); $i++){
        if(is_int(array_keys($_POST)[$i])){
            array_push($questionIndexes, array_keys($_POST)[$i]);
        }
    }
    foreach($questionIndexes as $i){
        $answerID = $selectObj->getIncrementedID("user_answers", "AnswerID");
        $questionAnswer = explode("|", $_POST[$i]);
        $questionID = $questionAnswer[0];
        $answer = $questionAnswer[1];
        $choiceID = $selectObj->getChoiceIDByQuestionIDAndChoice($questionID, $answer);
        $choiceID = is_object($choiceID) ? $choiceID->ChoiceID : "CH-0000";

        $isInserted = $insertObj->setUserAnswer($answerID, $_POST['user-id'], $questionID, $choiceID);
        array_push($result, $isInserted);
    }

    foreach($result as $res){
        if($res != true){
            $deleteObj = new Delete();
            $deleteObj->dropLevelScoreByUserIDAndLevelID($_POST['user-id'], $_POST['level-id']);
            $deleteObj->dropUserAnswerByUserIDAndLevelID($_POST['user-id'], $_POST['level-id']);
            
            echo "failed";
            break;
        }
    }