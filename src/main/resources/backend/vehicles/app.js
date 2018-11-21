


String.prototype.compose = (function () {
    var re = /\{{(.+?)\}}/g;
    return function (o) {
        return this.replace(re, function (_, k) {
            return typeof o[k] != 'undefined' ? o[k] : '';
        });
    }
}());

(function ($) {
    $.fn.serializeFormJSON = function () {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        delete o.save;
        delete o.clear;

        return o;
    };
})(jQuery);

$(document).ready(function () {
    const context = {};

    const slider = document.getElementById("image");
    const output = document.getElementById("demo");

    output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function() {
        output.innerHTML = this.value;
    }


    // read json

    context.udpdatetable = function (data) {
        console.log(JSON.stringify(data));

    }
    context.edit = function (trigger, data = {}) {

        let id = $(trigger).attr("id").replace("btn_id", "");
        let new_object = {};
        //$("#dataset").hide("slow");
        $.get('/JsonVehicles', {vehicle: JSON.stringify({id: id})}, function (data) {

            let form = $("#form");
            $.each(data, function (key, value) {
                form.find("input[name='" + key + "']").val(value);
            });
            //  $("#dataset").show("slow");


        }, "json");

        //let form=context.getData();
        //form.id=id;
        //$.post('/JsonVehicles',{vehicle: JSON.stringify( form )}, context.udpdatetable    , "json");

    }
    context.reset = function () {
        $('input').each(function () {
            $(this).val('');
        });

        $( ".edit" ).unbind( "click" );

        $('.edit').click(function () {


            context.edit(this);


        });

    }

    context.save = function (trigger) {


        let form = context.getData();



        $.post('/JsonVehicles', {vehicle: JSON.stringify(form)}, function (data) {


            if (form.id != "") {

                var tr = $("#row_id"+form.id);
                console.log("#row_id"+form.id);


                var row = '' +
                    ' <td  scope="row"><button type=button class="btn btn-info mb-2 edit" id=btn_id{{id}} >Edit </button></td>' +

                    '   <td scope="row" >{{name}}</td> </th>' +
                    ' <td scope="row">{{image}}</td>' +
                    ' <td scope="row">{{model}}</td>' +
                    ' <td scope="row">{{color}}</td>' +
                    ' <td scope="row"> {{type}}</td>' +
                    ' <td scope="row">{{year}}</td>' +
                    ' <td scope="row">{{size}}</td>' +
                    ' <td scope="row">{{price}}</td>' +
                    ' ';
                tr.html("");

                tr.append( row.compose(data));

                console.log(tr.html());

                context.reset();


            }
            else {
                var tbody = $('#tbt_ajax').children('tbody');
                var table = tbody.length ? tbody : $('#tbt_ajax');


                var row = '<tr id="row_id{{id}}"> ' +
                    ' <td  scope="row"><button type=button class="btn btn-info mb-2 edit" id=btn_id{{id}}>Edit </button></td>' +

                    '   <td scope="row" >{{name}}</td> </th>' +
                    ' <td scope="row">{{image}}</td>' +
                    ' <td scope="row">{{model}}</td>' +
                    ' <td scope="row">{{color}}</td>' +
                    ' <td scope="row"> {{type}}</td>' +
                    ' <td scope="row">{{year}}</td>' +
                    ' <td scope="row">{{size}}</td>' +
                    ' <td scope="row">{{price}}</td>' +
                    ' </tr>';
                table.append(row.compose(data));



                $('#tbt_ajax').show("fast");


                context.reset();


            }


        }, "json");

    }


    context.getData = function () {


        return $("#form").serializeFormJSON();
    }


    $('.edit').click(function () {


        context.edit(this);


    });


    $('#save').click(function () {


        context.save(this);


    });


    $('#new').click(function () {
        context.edit(this);
    });

    $('#clear').click(function () {


        $('input').each(function () {
            $(this).val('');
        });


    });

    $( ".loading" ).hide();

    $( document ).ajaxStart(function() {
        $( ".loading" ).show();
    });


    $( document ).ajaxStop(function() {
        $( ".loading" ).delay(1000).hide();
    });


});