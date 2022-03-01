$(function(){
    
    let isAsideCollapse = true;
    $('.btn-menu').on('click', function(){
        if(isAsideCollapse){
            $('aside').css('left', '0px');
            $('.aside-shadow').css('display', 'block');
            isAsideCollapse = false;
        }
        else{
            $('aside').css('left', '-245px');
            $('.aside-shadow').css('display', 'none');
            isAsideCollapse = true;
        }
    });

    $('.aside-shadow').on('click', function(){
        $('aside').css('left', '-245px');
        $('.aside-shadow').css('display', 'none');
        isAsideCollapse = true;
    });

    //Add Subjects
    $('aside #showModalAddSubject').on('click', function(e){
        e.preventDefault();
        $('#modalAddSubject').modal('show');
        $('#modalAddSubject #btnAddSubject').off('click');
        $('#modalAddSubject #btnAddSubject').on('click', function(){
            $.ajax({
                url: '../php/add-subject.php',
                method: 'POST',
                data:{
                    'title': $('#txtSubjectTitle').val()
                },
                cached: false,
                success: function(e){
                    if(e.includes("error")){
                        alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                    }
                    else{
                        if(e == 101){
                            alert("Subject already exists");
                        }
                        else{
                            window.location.replace('../pages/admin.subject.php?sub=' + e);
                        }
                    }
                }
            });
        });
    });
});