$(function(){
    
    function testInput(event) {
        var value = String.fromCharCode(event.which);
        var pattern = new RegExp(/[a-zåäö ]/i);
        return pattern.test(value);
    }
     
    $('#fName, #lName').bind('keypress', testInput);

    $('.register-container .img-container').on('click', function(){
        $('#img-file-input').click();
    });

    $('#img-file-input').on('change', function(){
        $('#profile-img').attr('src', window.URL.createObjectURL(this.files[0]));
    });

    $('#btn-register').on('click', function(){
        let isInputValid = false;
        let inputFields = $('.register-container input[type="text"], .register-container input[type="password"]');

        for(let i = 0; i < inputFields.length; i++){
            if(inputFields[i].value == ""){
                isInputValid = false;
                break;
            }
            else{
                isInputValid = true;
            }
        }

        if(isInputValid && $('#img-file-input').val() != ""){
            if($('#password').val().length >= 8){
                if($('#passwordConf').val() === $('#password').val()){
                    $('#modal-confirmation').modal('show');
                    $('#modal-confirmation #btn-submit').off('click');
                    $('#modal-confirmation #btn-submit').on('click', function(){
                        let formData = new FormData();
                        formData.append('img', $('#img-file-input')[0].files[0]);
                        formData.append('fName', $('#fName').val());
                        formData.append('lName', $('#lName').val());
                        formData.append('username', $('#username').val());
                        formData.append('password', $('#password').val());
    
                        $.ajax({
                            url: '../php/register-function.php',
                            method: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function(e){
                                if(e.includes('error')){
                                    $('#modal-confirmation').modal('hide');
                                    $('#modal-error').modal('show');
                                    $('#modal-error .modal-body').html(`
                                        <p>Something went wrong with the system, please try again later or contact the developer for assistance</p>`);
                                }
                                else if(e === "found"){
                                    $('#modal-confirmation').modal('hide');
                                    $('#modal-error').modal('show');
                                    $('#modal-error .modal-body').html(`
                                        <p>Username already exists</p>`);
                                }
                                else{
                                    window.location.replace('../pages/register-account-result.php');
                                }
                            }
                        });
                    });
                }
                else{
                    $('#modal-error').modal('show');
                    $('#modal-error .modal-body').html(`<p>Password dont match</p>`);
                }
            }
            else{
                $('#modal-error').modal('show');
                $('#modal-error .modal-body').html(`<p>Password must be atleast 8 characters</p>`);
            }
        }
        else{
            $('#modal-error').modal('show');
            $('#modal-error .modal-body').html(`<p>Please complete the input fields</p>`);
        }
    })

});