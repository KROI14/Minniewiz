<?php

    include '../includes/class-loader.php';
    $selectObj = new Select();
    
    function toAssoc($arr){
        return json_decode(json_encode($arr), true);
    }
    
    $subjects = toAssoc($selectObj->getSubjects());
    $users = toAssoc($selectObj->getUsers());
    $userData = [];
    
    for($i = 0; $i < count($users); $i++){
        $userID = $users[$i]['UserID'];
        
        $totalAve = 0;
        $totalTimeTaken = 0;
        
        $userData[$i]['UserID'] = $userID;
        $userData[$i]['Firstname'] = $users[$i]['Firstname'];
        $userData[$i]['Lastname'] = $users[$i]['Lastname'];
        $userData[$i]['Image'] = $users[$i]['Image'];
        
        for($j = 0; $j < count($subjects); $j++){
            $subjectID = $subjects[$j]['SubjectID'];
            $levels = toAssoc($selectObj->getLevelsBySubjectID($subjectID));
            
            $score = 0;
            
            for($k = 0; $k < count($levels); $k++){
                $levelID = $levels[$k]['LevelID'];
                
                $scoreData = toAssoc($selectObj->getLevelScoreByLevelIDAndUserID($levelID, $userID));
                $score = $score + ($scoreData['Score'] ?? 0);
            }
            
            $average = $score / count($levels);
            $totalAve = $totalAve + $average;
        }
        
        $userData[$i]['Score'] = $totalAve;
    }
    
    for($i = 0; $i < count($userData); $i++){
        for($j = $i + 1; $j < count($userData); $j++){
            if(floatval($userData[$i]['Score']) < floatval($userData[$j]['Score'])){
                $tmp = $userData[$j];
                $userData[$j] = $userData[$i];
                $userData[$i] = $tmp;
            }
        }
    }
    
    echo json_encode($userData);