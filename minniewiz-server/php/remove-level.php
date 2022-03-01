<?php

    include '../includes/class-loader.php';

    $deleteObj = new Delete();
    echo $deleteObj->dropLevelByID($_POST['level-id']);