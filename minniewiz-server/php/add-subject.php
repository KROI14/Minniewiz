<?php

    include '../includes/class-loader.php';

    $selectObj = new Select();
    $insertObj = new Insert();

    $subject = $selectObj->getSubjectByTitle($_POST['title']);
    if(is_object($subject)){
        echo 101;
    }
    else{
        $subjectID = $selectObj->getIncrementedID('subjects', 'SubjectID');
        $insertObj->setSubject($subjectID, $_POST['title']);
        echo $subjectID;
    }
?>