$(function(){

    let subjectID = $('#txtSubjectID').val();


    //Add Subject
    $('#btnShowDeleteConf').on('click', function(){
        $('#modalMessage').modal('show');
        $('#modalMessage .modal-header').html(`
            <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        `);
        $('#modalMessage .modal-body').html(`
            <p>Are you sure you want to remove this subject? This action will remove all
            the data that are connected in this subject</p>
        `);
        $('#modalMessage .modal-footer').html(`
            <button class="btn-wiz" data-bs-dismiss="modal">No</button>
            <button class="btn btn-danger" id="btnRemoveSubject">Yes</button>
        `);

        $('#modalMessage #btnRemoveSubject').off('click');
        $('#modalMessage #btnRemoveSubject').on('click', function(){
            $.ajax({
                url: '../php/remove-subject.php',
                method: 'POST',
                data:{
                    'subject-id': subjectID
                },
                cached: false,
                success: function(e){
                    if(e.includes('error')){
                        alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                    }
                    else{
                        window.location.replace('../pages/admin.dashboard.php');
                    }
                }
            });
        });
    });


    //Add Level
    $('#btnAddLevel').on('click', function(){
        let levelName = $('#modalAddLevel #txtLevelName').val();
        let duration = $('#modalAddLevel #txtlevelDuration').val();

        if(levelName == "" || duration == ""){
            alert("Please complete the input fields");
        }
        else{
            if(/^[0-9]?\d:[0-9]\d$/.test(duration)){
                $.ajax({
                    url: '../php/add-level.php',
                    method: 'POST',
                    data: {
                        'subject-id': subjectID,
                        'level-name': levelName,
                        'duration': duration,
                    },
                    cached: false,
                    success: function(e){
                        if(e.includes('error')){
                            alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                        }
                        else{
                            if(e == 101){
                                alert("Level already exists");
                            }
                            else{
                                window.location.reload();
                            }
                        }
                    }
                })
            }
            else{
                alert("Invalid time duration format. Please follow this \"min:sec\" time format");
            }
        }
    });

    
    //Level table function
    let levelRow = $('#table-levels tbody tr');
    for(let i = 0; i < levelRow.length; i++){
        $(levelRow[i]).on('click', function(){
            window.location.replace('../pages/admin.level.php?lvl=' + this.dataset.levelId + '&sub=' + this.dataset.subjectId);
        })
    }
});