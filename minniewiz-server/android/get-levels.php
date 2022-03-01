<?php

    include '../includes/class-loader.php';
    $selectObj = new Select();
    $levels = $selectObj->getLevelsBySubjectID($_POST['subject-id']);
    $levels = json_decode(json_encode($levels), true);

    for($i = 0; $i < count($levels); $i++){
        $levelScore = $selectObj->getLevelScoreByLevelIDAndUserID($levels[$i]["LevelID"], $_POST['user-id']);
        if(is_object($levelScore)){
            $levels[$i]["IsTaken"] = true;
            $levels[$i]['IsLocked'] = false;
        }
        else{
            $levels[$i]["IsTaken"] = false;
            $levels[$i]['IsLocked'] = true;
        }
    }
    
    for($i = 0; $i < count($levels); $i++){
        if($levels[$i]['IsTaken'] && $i != (count($levels) - 1)){
            $levels[$i + 1]['IsLocked'] = false;
        }
    }
    $levels[0]['IsLocked'] = false;
    
    echo json_encode($levels);