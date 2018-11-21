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
                <%@include  file="/backend/menu.jsp" %>
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


                    <div class="slidecontainer">
                        <input type="range" min="110" max="157" class="slider form-control"  value="110"  id="image" name="image" placeholder="Image Id ">
                        <p>Image #: <span id="demo"></span></p>
                    </div>


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
                    <input type="color" class="form-control" id="color" name="color" placeholder="color ">
                </div>


                <div class="form-group">
                    <label for="type">type</label>
                    <input type="text" class="form-control" id="type" name="type" placeholder="type ">
                </div>

                <div class="form-group">
                    <label for="year">year</label>
                    <input type="number"   class="form-control" id="year" name="year" placeholder="year ">
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
            <div class="loading">
                <img src="/images/ajax-loading.gif" title="Loading " >
                <strong>Loading Information , Please wait </strong>
            </div>

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

            <div class="loading">
                <img src="/images/ajax-loading.gif" title="Loading " >
                <strong>Loading Information , Please wait </strong>
            </div>

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

<script type="application/javascript" src="/backend/vehicles/app.js"></script>


</body>

</html>