<?php
    include '../includes/class-loader.php';

    $selectObj = new Select();
    $insertObj = new Insert();

    $level = $selectObj->getLevelBySubjectIDName($_POST['subject-id'], $_POST['level-name']);
    if(is_object($level)){
        echo 101;
    }
    else{
        $time = explode(':', $_POST['duration']);
        $millis = (($time[0] * 60) + $time[1]) * 1000;
    
        $levelID = $selectObj->getIncrementedID('levels', 'LevelID');
        echo $insertObj->setLevel($levelID, $_POST['subject-id'], $_POST['level-name'], $millis);
    }
?>