<?php

    include '../includes/class-loader.php';

    $insertObj = new Insert();
    $selectObj = new Select();
    $deleteObj = new Delete();
    
    $arrResult = array();

    $questionID = $selectObj->getIncrementedID('questions', 'QuestionID');
    $levelID = $_POST['level-id'];
    $question = $_POST['question'];
    $setQuestion = $insertObj->setQuestion($questionID, $_POST['level-id'], $question);
    array_push($arrResult, $setQuestion);

    if(isset($_FILES['img-files'])){
        $files = $_FILES['img-files'];
        for($i = 0; $i < count($files['type']); $i++){
            $imgName = uniqid() . $files['name'][$i];
            $path = '../user-uploads/' . $imgName;
            if(move_uploaded_file($files['tmp_name'][$i], $path)){
                $imgID = $selectObj->getIncrementedID('question_images', 'ImageID');
                $imgInsert = $insertObj->setQuestionImage($imgID, $questionID, $imgName);
                array_push($arrResult, $imgInsert);
            }
        }
    }


    $choices = explode(',', $_POST['choices']);
    foreach($choices as $choice){
        $choiceID = $selectObj->getIncrementedID('choices', 'ChoiceID');
        $setChoice = $insertObj->setChoices($choiceID, $questionID, $choice);
        array_push($arrResult, $setChoice);
    }


    $answer = $_POST['answer'];
    $setAnswer = $insertObj->setAnswer($questionID, $answer);
    array_push($arrResult, $setAnswer);

    if(in_array(0, $arrResult)){
        $deleteObj->dropQuestionByID($questionID);
        echo "error";
    }
    else{
        echo 202;
    }
?>