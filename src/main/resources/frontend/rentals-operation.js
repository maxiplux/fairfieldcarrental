$(document).ready(function () {
    'use strict';

    function validate() {
        var start = moment($('[name=startdate]').val());
        var end = moment($('[name=enddate]').val());

        if (start.isValid() && end.isValid() && end.isAfter(start)) {
            return true;
        }

        return false;
    }

    function showDateErrors() {
        $('.error-msg').text('Invalid dates');
        $('.error-msg').removeClass('d-none');
    }

    function cleanDateErrors() {
        $('.error-msg').text('');
        $('.error-msg').addClass('d-none');
    }


    $('[type=date]').on('change', function () {
        if (!validate()) {
            showDateErrors();
        }
        else {
            cleanDateErrors();
        }
    });

    $('[type=submit]').on('click', function (e) {
        e.preventDefault();
        if (validate()) {
            $('#operation').submit();
        }
        else {
            showDateErrors();
        }
    });

    $('.simulate').on('click', function () {
        if (validate()) {
            $('#loading').html('<img src="http://preloaders.net/preloaders/287/Filling%20broken%20ring.gif"> loading...');

            var inputData = {
                id: $("[name=id]").val(),
                enddate: $("[name=enddate]").val(),
                startdate: $("[name=startdate]").val()
            };

            $.post('/JsonOperation', inputData, function (data) {
                console.log(data);
                var operation = JSON.parse(data);
                $("#price").text(operation.price);
                $('#loading').html('');
            });
        }
        else {
            showDateErrors();
        }
    })
});