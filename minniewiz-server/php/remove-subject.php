<?php

    include '../includes/class-loader.php';

    $deleteObj = new Delete();
    echo $deleteObj->dropSubjectByID($_POST['subject-id']);