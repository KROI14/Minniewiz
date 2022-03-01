<?php

include '../includes/class-loader.php';

$selectObj = new Select();
$isUserExists = $selectObj->getUserByUsername($_POST['username']);
if(count($isUserExists) == 0){
    $imgBase64 = $_POST['img'];
    $filename = "user-" . uniqid() . ".jpg";

    $decode = base64_decode($imgBase64);
    if(file_put_contents("../user-uploads/" . $filename, $decode)){
        $insertObj = new Insert();
        $userID = $selectObj->getIncrementedID("users", "UserID");
        $isInserted = $insertObj->setUser($userID, $_POST['firstname'], $_POST['lastname'], $_POST['username'], $_POST['password'], $filename);
        if($isInserted){
            echo 105;
        }
        else{
            unlink("../user-uploads/" . $filename);
            echo 102;
        }
    }
    else{
        echo 101;
    }
}
else{
    echo 100;
}

