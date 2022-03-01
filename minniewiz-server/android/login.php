<?php
    include '../includes/class-loader.php';
    
    $selectObj = new Select();
    $user = $selectObj->getUserByUsernameAndPassword($_POST['username'], $_POST['password']);

    if(is_object($user)){
        echo $user->UserID;
    }
    else{
        echo "Invalid";
    }