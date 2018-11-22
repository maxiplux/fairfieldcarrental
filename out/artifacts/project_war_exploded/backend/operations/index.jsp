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


        <div class="col-12" id="dataset">

            <h2>Reports about operations</h2>
            <table class="table table-dark" id="tbt_ajax">


                <thead>
                <tr>

                    <th scope="col">Vehicle</th>
                    <th scope="col">User</th>
                    <th scope="col">Price</th>
                    <th scope="col">start</th>
                    <th scope="col">end</th>


                </tr>
                </thead>
                <tbody>

                <c:forEach items="${operations}" var="operation">
                    <tr id="row_id${operation.id}">




                        <td scope="row"> ${operation.vehicle.name}</td>
                        <td scope="row"> ${operation.user.firstName} ${operation.user.lastName} ${operation.user.email} </td>


                        <td scope="row"> ${operation.price}</td>
                        <td scope="row"> ${operation.date_start}</td>
                        <td scope="row"> ${operation.date_end}</td>





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