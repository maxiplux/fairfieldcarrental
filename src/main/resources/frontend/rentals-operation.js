$(document).ready(function(){
'use strict';

    function validate(){
        var start = moment($('[name=startdate]').val());
        var end = moment($('[name=enddate]').val());

        if(start.isValid() && end.isValid() && end.isAfter(end)){
            return true;
        }

        return false;
    }

    function showDateErrors(){
        $('.error-msg').text('Invalid dates');
        $('.error-msg').removeClass('d-none');
    }

    function cleanDateErrors(){
        $('.error-msg').text('');
        $('.error-msg').addClass('d-none');
    }


    $('[name=startdate]').on('change', function(){
        if(!validate()){
            showDateErrors();
        }
        else{
            cleanDateErrors();
        }
    })

    $('[name=startdate]').on('change', function(){
        if(!validate()){
            showDateErrors();
        }
        else {
            cleanDateErrors();
        }
    });

    // $('[type=submit]').on('click', function(e){
    //     e.preventDefault();
    //     if(validate()){
    //         $('[type=submit]').submit();
    //     }
    //     else {
    //         showDateErrors();
    //     }
    // });

    $('.simulate').on('click', function(){

        $.post('/JsonOperation', {id: JSON.stringify(form)}, function (data) {

        });
    })
});