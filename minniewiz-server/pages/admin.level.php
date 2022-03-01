<?php
    include '../includes/header.inc.php';
    include '../includes/inside-nav.php';

    function customEcho($str){
        echo (strlen($str)<=15) ? $str : substr($str, 0, 20) . '...';
    }

    $subject = $selectObj->getSubjectByID($_GET['sub']);
    $level = $selectObj->getLevelBySubjectIDAndLevelID($_GET['sub'], $_GET['lvl']);
    $questions = $selectObj->getQuestionsByLevelID($_GET['lvl']);

    $numbering = 1;
?>

<style>
    .img-container{
        width: 120px;
        height: 120px;
        border-radius: 3px;
        border: 2px solid gray;
    }
</style>

<input type="hidden" value="<?php echo $level->LevelID?>" id="levelID">
<input type="hidden" value="<?php echo $subject->SubjectID?>" id="subjectID">

<div class="container-fluid pt-3 pb-3">
    <div class="card-container">
        <h2 class="m-0"><?php echo $subject->Title . " (" . $level->Name . ")"; ?></h2>
    </div>

    <div class="row">
        <div class="col-12 col-lg-8">
            <div class="card-container mt-3">
                <label style="color: rgb(105, 105, 105);">Questions</label>
                <div class="table-container">
                    <table class="table table-hover" id="table-question">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Question</th>
                                <th scope="col">-</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($questions as $question): ?>
                                <tr data-question-id="<?php echo $question->QuestionID; ?>">
                                    <td><?php echo $numbering++; ?></td>
                                    <td><?php echo customEcho($question->Question); ?></td>
                                    <td><button class="btn btn-danger btn-delete" value="<?php echo $question->QuestionID; ?>">Delete</button></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="card-container mt-3">
                <button class="btn-wiz w-100" data-bs-toggle="modal" data-bs-target="#modalAddQuestion"><i class="fas fa-plus"></i> Add Question</button>
            </div>
            <div class="card-container mt-3">
                <button class="btn btn-danger w-100" data-bs-target="#modalMessage" data-bs-toggle="modal"><i class="fas fa-trash-alt"></i> Remove Level</button>
            </div>
        </div>
    </div>
</div>


<!-- Delete level confirmation -->
<div class="modal fade" tabindex="-1" id="modalMessage">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                Delete Confirmation
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this level?</p>
            </div>
            <div class="modal-footer">
                <button class="btn-wiz" data-bs-dismiss="modal">No</button>
                <button class="btn btn-danger" id="btnDeleteLevel">Yes</button>
            </div>
        </div>
    </div>
</div>


<!-- Add Question -->
<div class="modal fade" tabindex="-1" id="modalAddQuestion">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Question</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="px-1">
                    <label style="color: rgb(105, 105, 105);">Images</label>
                    <div class="row">
                        <div class="col-6 col-sm-4">
                            <div class="img-container mx-auto">
                                <img src="../img/img_image-placeholder.png" class="img-placeholder" width="100%" height="100%">
                            </div>
                        </div>
                        <div class="col-6 col-sm-4">
                            <div class="img-container mx-auto">
                                <img src="../img/img_image-placeholder.png" class="img-placeholder" width="100%" height="100%">
                            </div>
                        </div>
                        <div class="col-12 col-sm-4">
                            <div class="img-container mt-2 mx-auto mt-sm-0">
                                <img src="../img/img_image-placeholder.png" class="img-placeholder" width="100%" height="100%">
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="text-center">
                                <input type="file" class="d-none" id="imgQuestionFile" accept="image/*" multiple>
                                <label class="btn-wiz mt-2" for="imgQuestionFile">Upload Images</label>
                            </div>
                        </div>
                    </div>

                    <label style="color: rgb(105, 105, 105);" class="mt-4">Question</label>
                    <textarea class="wiz-input" style="resize: none;" rows="7" id="txtQuestion"></textarea>
                    
                    <label style="color: rgb(105, 105, 105);" class="mt-4">Choices</label>
                    <div class="choices-inputs">
                        <div class="input-group">
                            <div class="input-group-text">
                                <input class="form-check-input mt-0" type="radio" name="choice">
                            </div>
                            <input type="text" class="form-control wiz-input" placeholder="1st Choice">
                        </div>
                        
                        <div class="input-group mt-2">
                            <div class="input-group-text">
                                <input class="form-check-input mt-0" type="radio" name="choice">
                            </div>
                            <input type="text" class="form-control wiz-input" placeholder="2nd Choice">
                        </div>
                        
                        <div class="input-group mt-2">
                            <div class="input-group-text">
                                <input class="form-check-input mt-0" type="radio" name="choice">
                            </div>
                            <input type="text" class="form-control wiz-input" placeholder="3rd Choice">
                        </div>
                        
                        <div class="input-group mt-2">
                            <div class="input-group-text">
                                <input class="form-check-input mt-0" type="radio" name="choice">
                            </div>
                            <input type="text" class="form-control wiz-input" placeholder="4th Choice">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn-wiz" data-bs-dismiss="modal">Cancel</button>
                <button class="btn-wiz" id="btnSaveQuestion">Save</button>
            </div>
        </div>
    </div>
</div>

<!-- View question -->
<div class="modal fade" id="modalQuestionView">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<!-- Question remove confirmation -->
<div class="modal fade" tabindex="-1" id="modalRemoveQuestion">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                Delete Confirmation
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this Question?</p>
            </div>
            <div class="modal-footer">
                <button class="btn-wiz" data-bs-dismiss="modal">No</button>
                <button class="btn btn-danger" id="btnDeleteQuestion">Yes</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/admin.level.js?v=<?php echo time()?>"></script>
<?php
    include '../includes/footer.inc.php';
?>