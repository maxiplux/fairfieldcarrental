<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- table bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <link rel="stylesheet" href="/backend/dashboard.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script type="application/javascript">

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


                        context.reset();
                        $('#tbt_ajax').show("fast");


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


        });

    </script>


</head>

<body>

<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">Fairfield Car Rental Services</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Dashboard Report
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="vehicles" href="#">Vehicles


                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="users" href="#">Users</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="operations" href="#">Operations</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Log out</a>
                </li>
            </ul>

        </div>
    </nav>
</header>


<!-- Begin page content -->
<main role="main" class="container">


    <div class="row">

        <div class="col-3">


            <form id="form">

                <caption>Vehicle Form</caption>

                <div class="form-group">
                    <label for="name">Name</label>

                    <input type="hidden" class="form-control" id="id" name="id" placeholder="id">

                    <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp"
                           placeholder="Name">
                    <small id="emailHelp" class="form-text text-muted">Name of Vehicle</small>
                </div>

                <div class="form-group">
                    <label for="image">Image Id</label>
                    <input type="text" class="form-control" id="image" name="image" placeholder="Image Id ">
                </div>

                <div class="form-group">
                    <label for="mak">Mak</label>
                    <input type="text" class="form-control" id="mak" name="mak" placeholder="Mak ">
                </div>


                <div class="form-group">
                    <label for="Model">Model</label>
                    <input type="text" class="form-control" id="model" name="model" placeholder="model ">
                </div>

                <div class="form-group">
                    <label for="Color">Color</label>
                    <input type="text" class="form-control" id="color" name="color" placeholder="color ">
                </div>


                <div class="form-group">
                    <label for="type">type</label>
                    <input type="text" class="form-control" id="type" name="type" placeholder="type ">
                </div>

                <div class="form-group">
                    <label for="year">year</label>
                    <input type="number" class="form-control" id="year" name="year" placeholder="year ">
                </div>


                <div class="form-group">
                    <label for="size">size</label>
                    <input type="number" class="form-control" id="size" name="size" placeholder="size ">
                </div>

                <div class="form-group">
                    <label for="price">price</label>
                    <input type="number" class="form-control" id="price" name="price" placeholder="price ">
                </div>


                <button type="button" id="save" class="btn btn-primary">Save</button>

                <button type="button" id="clear" class="btn btn-danger">clear</button>
            </form>

        </div>
        <div class="col-9" id="dataset">

            <h2>Vehicles</h2>
            <table class="table table-dark" id="tbt_ajax">


                <thead>
                <tr>
                    <th scope="col">Action</th>
                    <th scope="col">name</th>
                    <th scope="col">image</th>
                    <th scope="col">mak</th>
                    <th scope="col">model</th>
                    <th scope="col">color</th>
                    <th scope="col">type</th>
                    <th scope="col">year</th>
                    <th scope="col">size</th>
                    <th scope="col">price</th>


                </tr>
                </thead>
                <tbody>

                <c:forEach items="${vehicles}" var="vehicle">
                    <tr id="row_id${vehicle.id}">


                        <td>

                            <button type="button" class="btn btn-info mb-2 edit" id="btn_id${vehicle.id}">Edit
                            </button>

                        </td>


                        <td scope="row"> ${vehicle.name}</td>


                        <td scope="row"> ${vehicle.image}</td>


                        <td scope="row"> ${vehicle.mak}</td>


                        <td scope="row"> ${vehicle.model}</td>
                        <td scope="row"> ${vehicle.type}</td>


                        <td scope="row"> ${vehicle.color}</td>


                        <td scope="row"> ${vehicle.year}</td>


                        <td scope="row"> ${vehicle.size}</td>


                        <td scope="row"> ${vehicle.price}</td>


                    </tr>
                </c:forEach>


                </tbody>
            </table>


        </div>


</main>

<footer class="footer">
    <div class="container">
        <span class="text-muted">1000 N 4th St, Fairfield, IA 52557.</span>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>

</html>