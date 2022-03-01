<link rel="stylesheet" href="../styles/outside-nav.css?v=<?php echo time()?>">
<nav>
    <img src="../img/img_logo.png" width="50px">

    <div class="menu">
        <a href="../pages/index.php" class="<?php echo Request::is('index.php') ? "active" : ""?>">Home</a>
        <a href="../pages/login.php" class="<?php echo Request::is('login.php') ? "active" : ""?>">Login</a>
    </div>
</nav>