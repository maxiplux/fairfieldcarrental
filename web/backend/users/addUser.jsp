
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
    <title>Add User</title>

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




            <form class="form-signin" action="/newUserController" method="post" id="newuser">
                <%--<img class="mb-4" src="/backend/car-rental-logo.png" alt="" width="200" height="200">--%>
                <h1 class="h3 mb-3 font-weight-normal">Create Customer</h1>
                <label for="firstname" class="sr-only">First Name</label>
                <input type="text" name="firstname" id="firstname" class="form-control" placeholder="first name" required>
                <label for="middlename" class="sr-only">First Name</label>
                <input type="text" name="middlename" id="middlename" class="form-control" placeholder="middle name" required>
                <label for="lastname" class="sr-only">First Name</label>
                <input type="text" name="lastname" id="lastname" class="form-control" placeholder="last name" required>
                <label for="email" class="sr-only">Email address</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required autofocus>
                <label for="password" class="sr-only">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                <%--<div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" name="remember" value="remember-me"> Remember me
                    </label>
                </div>--%>
                <br /> <br />
                <button class="btn btn-lg btn-primary btn-block" type="submit" id="createUser">Create</button>
        </div>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
        </form>

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

