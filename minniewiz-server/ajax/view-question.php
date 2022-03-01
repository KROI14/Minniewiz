<?php
    include '../includes/class-loader.php';
    $selectObj = new Select();

    $question = $selectObj->getQuestionByQuestionID($_POST['question-id']);
    $choices = $selectObj->getChoicesByQuestionID($_POST['question-id']);
    $answer = $selectObj->getAnswerByQuestionID($_POST['question-id']);
    $questionImages = $selectObj->getQuestionImagesByQuestionID($_POST['question-id']);
    $imgCount = 0;
?>

<div class="modal-header">
    <h5 class="modal-title">View Question</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
    <label style="color: rgb(105, 105, 105);">Images</label>
    <div class="row">
        <?php foreach($questionImages as $questionImage): ?>
            <?php $imgCount++; ?>
            <div class="<?php echo ($imgCount == 3) ? "col-12" : "col-6"?> col-sm-4 p-0">
                <div class="img-container mx-auto mt-2">
                    <img src="../user-uploads/<?php echo $questionImage->Image?>" class="img-placeholder" width="100%" height="100%">
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <label style="color: rgb(105, 105, 105);" class="mt-3">Question</label>
    <textarea class="wiz-input" style="resize: none;" rows="7" id="txtQuestion" readonly><?php echo $question->Question ?></textarea>

    <label style="color: rgb(105, 105, 105);" class="mt-3">Choices</label>
    <?php foreach($choices as $choice): ?>
        <input type="text"
            class="wiz-input mt-1 <?php echo ($choice->Choice == $answer->Answer) ? "text-success" : ""?>"
            style="font-weight: <?php echo ($choice->Choice == $answer->Answer) ? "600" : "500"?>;"
            value="<?php echo $choice->Choice?>"
            readonly>
    <?php endforeach; ?>
</div>

<div class="modal-footer">
    <button type="button" class="btn-wiz" data-bs-dismiss="modal">Close</button>
</div>