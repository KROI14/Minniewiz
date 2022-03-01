<?php
    include '../includes/header.inc.php';
    include '../includes/inside-nav.php';

    $users = $selectObj->getUsers();
?>
<link rel="stylesheet" href="../styles/admin.dashboard.css?v=<?php echo time()?>">

<div class="container-fluid my-3">
    <div class="card-container">
        <p>Users</p>
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">User ID</th>
                        <th scope="col">Image</th>
                        <th scope="col">Name</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($users as $user): ?>
                        <tr>
                            <th scope="row"><?php echo $user->UserID ?></th>
                            <td>
                                <div class="overflow-hidden rounded-circle" style="width: 70px; height: 70px;">
                                    <img src="../user-uploads/<?php echo $user->Image?>" width="100%" height="100%">
                                </div>
                            </td>
                            <td><?php echo $user->Firstname . " " . $user->Lastname?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php
    include '../includes/footer.inc.php';
?>