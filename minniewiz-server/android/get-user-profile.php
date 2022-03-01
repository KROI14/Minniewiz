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
    
    $userLevelScore = toAssoc($selectObj->getUserLevelScoreByUserID($_POST['user-id']));
    if(isset($userLevelScore['UserID'])){
        $arrUserID = array_column($userData, "UserID");
        $rank = array_search($_POST['user-id'], $arrUserID);
        $userData = $userData[$rank];
        $userData["Score"] = number_format($userData['Score'], 2, ".", "");
        $userData['Rank'] = $rank;
    }
    else{
        $user = $selectObj->getUserByUserID($_POST['user-id']);
        
        $userData = $userLevelScore;
        $userData['Firstname'] = $user['Firstname'];
        $userData['Lastname'] = $user['Lastname'];
        $userData['Image'] = $user['Image'];
        $userData['Rank'] = false;
    }
    
    echo json_encode($userData);