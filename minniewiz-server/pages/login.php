<?php
    include '../includes/header.inc.php';
    include '../includes/outside-nav.php';
?>
<link rel="stylesheet" href="../styles/login.css?v=<?php echo time()?>">

<div class="container">
    <div class="login-container">
        <h1>Login</h1>
        <p class="mb-3" style="color:gray;">This page is for admin users only</p>
        <label>Username</label>
        <input type="text" class="wiz-input text-center" id="username">

        <label class="mt-3">Password</label>
        <input type="password" class="wiz-input text-center" id="password">
        
        <div class="text-end">
            <button class="btn-wiz mt-3" id="btnLogin">Login</button>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="loginNote">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Login Failed</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Incorrect Username or Password</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-wiz" data-bs-dismiss="modal">Okay</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/login.js?v=<?php echo time()?>"></script>
<?php
    include '../includes/footer.inc.php';
?>