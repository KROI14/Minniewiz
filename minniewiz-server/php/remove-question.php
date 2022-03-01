<?php

    include '../includes/class-loader.php';
    $deleteObj = new Delete();
    echo $deleteObj->dropQuestionByID($_POST['question-id']);

?>