<link rel="stylesheet" href="../styles/inside-nav.css?v=<?php echo time()?>">

<nav>
    <div class="btn-menu">
        <i class="fas fa-bars"></i>
    </div>

    <img src="../img/img_logo.png" width="40px">

    <div class="profile-container">
        <img src="../img/img_profile-placeholder.png" width="100%">
    </div>
</nav>

<div class="aside-shadow"></div>

<aside>
    <div class="aside-top">
        <div class="btn-menu">
            <i class="fas fa-bars"></i>
        </div>
    </div>

    <ul>
        <li>
            <a href="../pages/admin.dashboard.php" class="<?php echo Request::is('admin.dashboard.php') ? "active" : "" ?>">
                <i class="fas fa-chart-line"></i>Dashboard
            </a>
        </li>

        <li class="menu-label">Subjects</li>
        <?php $subjects = $selectObj->getSubjects(); ?>
        <?php foreach($subjects as $subject): ?>
            <li>
                <a href="../pages/admin.subject.php?sub=<?php echo $subject->SubjectID?>"
                    class="subject <?php echo Request::is('admin.subject.php?sub=' . $subject->SubjectID) ? "active" : "" ?>">
                    <?php echo $subject->Title?>
                </a>
            </li>
        <?php endforeach ?>
        <li>
            <a id="showModalAddSubject" href=""><i class="fas fa-plus"></i>Add Subject</a>
        </li>

        <li class="menu-label">Options</li>
        <li>
            <a href="../php/logout-function.php"><i class="fas fa-sign-out-alt"></i>Logout</a>
        </li>
    </ul>
</aside>

<div class="modal fade" tabindex="-1" id="modalAddSubject">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Subject</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" class="wiz-input text-center" placeholder="Input Subject title" id="txtSubjectTitle">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-wiz" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn-wiz" id="btnAddSubject">Add</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/inside-nav.js?v=<?php echo time()?>"></script>