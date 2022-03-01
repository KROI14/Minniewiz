<?php
    include '../includes/header.inc.php';
    include '../includes/inside-nav.php';

    function millisToMinSec($millis){
        $min = (($millis / (1000 * 60)) % 60);
        $sec = ($millis / 1000) % 60;
        return sprintf("%02d", $min) . ":" . sprintf("%02d", $sec);
    }

    $subject = $selectObj->getSubjectByID($_GET['sub']);
    $levels = $selectObj->getLevelsBySubjectID($_GET['sub']);
?>

<input type="hidden" value="<?php echo $_GET['sub']?>" id="txtSubjectID">

<div class="container-fluid pb-3">
    <div class="card-container mt-3">
        <h2 class="m-0"><?php echo $subject->Title ?></h2>
    </div>

    <div class="row mt-3">
        <div class="col-12 col-lg-8">
            <div class="card-container">
                <label style="color: rgb(105, 105, 105);">Levels</label>
                <div class="table-container">
                    <table class="table table-hover" id="table-levels">
                        <thead>
                            <tr>
                                <th scope="col">Level</th>
                                <th scope="col">No. of Questions</th>
                                <th scope="col">Duration</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($levels as $level): ?>
                                <?php $questionCount = $selectObj->getQuestionCountByLevelID($level->LevelID); ?>
                                <tr data-level-id="<?php echo $level->LevelID; ?>" data-subject-id="<?php echo $_GET['sub']; ?>">
                                    <th scope="row"><?php echo $level->Name; ?></th>
                                    <td><?php echo $questionCount; ?></td>
                                    <td><?php echo millisToMinSec($level->Duration)?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-4">
            <div class="card-container mt-3 mt-lg-0">
                <button class="btn-wiz w-100" data-bs-toggle="modal" data-bs-target="#modalAddLevel"><i class="fas fa-plus"></i> Add Level</button>
            </div>
            <div class="card-container mt-3">
                <button class="btn btn-danger w-100" id="btnShowDeleteConf"><i class="fas fa-trash-alt"></i> Remove Subject</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="modalMessage">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="modalAddLevel">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Question</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <div class="px-4">
                    <label style="color: rgb(105, 105, 105);">Level Name</label>
                    <input type="text" class="wiz-input text-center" id="txtLevelName">

                    <label style="color: rgb(105, 105, 105);" class="mt-3">Time Duration</label>
                    <input type="text" class="wiz-input text-center" id="txtlevelDuration">
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn-wiz" data-bs-dismiss="modal">Cancel</button>
                <button class="btn-wiz" id="btnAddLevel">Add Level</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/admin.subject.js?v=<?php echo time()?>"></script>
<?php
    include '../includes/footer.inc.php';
?>