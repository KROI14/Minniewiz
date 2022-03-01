<?php

    include '../includes/class-loader.php';

    $selectObj = new Select();

    $questions = json_decode(json_encode($selectObj->getQuestionsByLevelID($_POST['level-id'])), true);

    for($i = 0; $i < count($questions); $i++){
        $questions[$i]["Images"] = json_decode(json_encode($selectObj->getQuestionImagesByQuestionID($questions[$i]['QuestionID'])), true);
        $questions[$i]["Choices"] = json_decode(json_encode($selectObj->getChoicesByQuestionID($questions[$i]['QuestionID'])), true);
        $questions[$i]["Answer"] = json_decode(json_encode($selectObj->getAnswerByQuestionID($questions[$i]['QuestionID'])), true);
    }
    
    echo json_encode($questions);