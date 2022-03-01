<?php
    include '../includes/header.inc.php';
    include '../includes/outside-nav.php';
?>
<link rel="stylesheet" href="../styles/register-account.css?v=<?php echo time()?>">

<div class="container">
    <div class="row">
        <div class="col-12 col-lg-6">
            <div class="register-container mx-auto">
                <h1 class="mb-3">Create an account</h1>

                <div class="img-container">
                    <img src="../img/img_profile-placeholder.png" width="100%" id="profile-img">
                </div>
                <input type="file" class="d-none" id="img-file-input" accept="image/*">

                <label>Firstname</label>
                <input type="text" class="wiz-input text-center" id="fName">

                <label class="mt-2">Lastname</label>
                <input type="text" class="wiz-input text-center" id="lName">

                <label class="mt-2">Username</label>
                <input type="text" class="wiz-input text-center" id="username">

                <label class="mt-2">Password</label>
                <input type="password" class="wiz-input text-center" id="password">

                <label class="mt-2">Password Confirmation</label>
                <input type="password" class="wiz-input text-center" id="passwordConf">

                <div class="text-end">
                    <button class="btn-wiz mt-3" id="btn-register">Register</button>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-6">
            <img src="../img/img_logo.png" width="320px" class="mx-auto d-block mt-5">
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="modal-error">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Account Registration Failed</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn-wiz" data-bs-dismiss="modal">Okay</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="modal-confirmation">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Account Registration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to register this account?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-wiz" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn-wiz" id="btn-submit">Yes</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/register-account.js?v=<?php echo time()?>"></script>
<?php
    include '../includes/footer.inc.php';
?>