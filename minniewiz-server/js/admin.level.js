$(function(){

    //Add Question, Choices, Answer
    $('#btnSaveQuestion').on('click', function(){
        let radioChoices = $('.choices-inputs input[type="radio"]:checked').parent();
        let inputChoices = $('.choices-inputs .input-group input[type="text"]');

        let levelID = $('#levelID').val();
        let question = $('#txtQuestion').val();
        let answer = $(radioChoices).next().val();
        let choices = [];
        for(let i = 0; i < inputChoices.length; i++){
            choices[i] = inputChoices[i].value;
        }
        
        if(levelID == ""){
            alert("Please select level");
        }
        else if(choices.includes("")){
            alert("Please complete the choices");
        }
        else if(question == ""){
            alert("Please input a question");
        }
        else if(answer == undefined){
            alert("Please choose a correct answer");
        }
        else{
            if(confirm("Are you sure you want to insert this question?")){
                let formData = new FormData();
                formData.append('level-id', levelID);
                formData.append('question', question);
                formData.append('choices', choices);
                formData.append('answer', answer);
                for(let i = 0; i < $('#imgQuestionFile')[0].files.length; i++){
                    formData.append('img-files[]', $('#imgQuestionFile')[0].files[i]);
                }
                $.ajax({
                    url: '../php/add-question.php',
                    method: 'POST',
                    data: formData,
                    cached: false,
                    contentType: false,
                    processData: false,
                    success: function(e){
                        if(e.includes('error')){
                            alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                        }
                        else{
                            alert("Question inserted successfully");
                            window.location.reload();
                        }
                    }
                });
            }
        }
    });


    //display image before upload
    $('#imgQuestionFile').on('change', function(){
        let imgPlaceholder = $('#modalAddQuestion .img-placeholder');
        for(let i = 0; i < this.files.length; i++){
            $(imgPlaceholder[i]).attr('src', window.URL.createObjectURL(this.files[i]));
        }
    });


    //Remove level
    $('#btnDeleteLevel').on('click', function(){
        $.ajax({
            url: '../php/remove-level.php',
            method: 'POST',
            data:{
                'level-id': $('#levelID').val()
            },
            cached: false,
            success: function(e){
                if(e.includes('error')){
                    alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                }
                else{
                    window.location.replace('../pages/admin.subject.php?sub=' + $('#subjectID').val());
                }
            }
        });
    });
    

    
    //table question function
    let questionRow = $('#table-question tbody tr');
    for(let i = 0; i < questionRow.length; i++){

        $(questionRow[i]).on('click', function(){
            $('#modalQuestionView').modal('show');
            $('#modalQuestionView .modal-content').load('../ajax/view-question.php', {
                'question-id': this.dataset.questionId
            })
        });

    }
    

    //Delete question
    $('#table-question tbody .btn-delete').on('click', function(e){
        e.stopPropagation();

        let questionID = this.value;
        
        $('#modalRemoveQuestion').modal('show');
        $('#modalRemoveQuestion #btnDeleteQuestion').off('click');
        $('#modalRemoveQuestion #btnDeleteQuestion').on('click', function(){
            $.ajax({
                url: '../php/remove-question.php',
                method: 'POST',
                data: {
                    'question-id': questionID
                },
                cached: false,
                success: function(e){
                    if(e.includes('error')){
                        alert("Something went wrong with the system, please try again later or contact the developer for assistance");
                    }
                    else{
                        alert("Question has been removed successfully");
                        window.location.reload();
                    }
                }
            })
        })
    });
});