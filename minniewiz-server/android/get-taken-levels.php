<?php

    include '../includes/class-loader.php';
    $selectObj = new Select();
    
    $takenLevels = $selectObj->getTakenLevelsByUserIDAndSubjectID($_POST['user-id'], $_POST['subject-id']);

    foreach($takenLevels as $key => $level){
        $count = $selectObj->getQuestionCountByLevelID($level->LevelID);
        $takenLevels[$key]->Items = $count;
        $takenLevels[$key]->CreatedAt = date("l M j, g:i a", strtotime($takenLevels[$key]->CreatedAt));
    }
    
    echo json_encode($takenLevels);