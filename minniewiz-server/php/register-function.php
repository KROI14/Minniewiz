<?php

    include '../includes/class-loader.php';

    $insertObj = new Insert();
    $selectObj = new Select();

    $userID = $selectObj->getIncrementedID('users', 'UserID');
    $users = $selectObj->getUserByUsername($_POST['username']);
    
    if(count($users) == 0){
        $img = $_FILES['img'];
        $imgName = uniqid() . $img['name'];
    
        if(move_uploaded_file($img['tmp_name'], '../user-uploads/' . $imgName)){
            echo $insertObj->setUser($userID, $_POST['fName'], $_POST['lName'], $_POST['username'], $_POST['password'], $imgName);
        }
    }
    else{
        echo "found";
    }