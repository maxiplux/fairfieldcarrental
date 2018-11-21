
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

            <h2>Users</h2>

            <a class="btn btn-primary" href="/backend/users/addUser.jsp" role="button">New User</a>

            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Middle Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Operation</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${users}" var="user">
                <tr>

                    <td>${user.id}</td>
                    <td>${user.firstName}</td>
                    <td>${user.middleName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>

                    <td><a  class="btn btn-primary"  href="/EditUserController?id=${user.id}">Edit</a></td>

                </tr>
                </c:forEach>

                </tr>

                </tbody>
            </table>


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

</body>

</html>