$(function(){
    
    $('#btnLogin').on('click', function(){

        let username = $('#username').val();
        let password = $("#password").val();

        if(username == "admin" && password == "admin"){
            window.location.replace('../pages/admin.dashboard.php');
        }
        else{
            $('#loginNote').modal('show');
        }

    })

});