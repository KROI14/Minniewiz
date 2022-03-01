<?php

    include '../includes/class-loader.php';

    $selectObj = new Select();
    $subjects = $selectObj->getTakenSubjectsByUserID($_POST['user-id']);
    
    $subjectsTaken = [];
    foreach($subjects as $subject){
        $subj = $selectObj->getSubjectByID($subject->SubjectID);
        array_push($subjectsTaken, $subj);
    }
    
    echo json_encode($subjectsTaken);