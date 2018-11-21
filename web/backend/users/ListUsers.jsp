
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


        <div class="col-12" >

            <div id="loading">
            <img src="/images/ajax-loading.gif" title="Loading " >
                <strong>Loading Information , Please wait </strong>
            </div>

            <div  id="dataset"></div>



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


<script >



    // A $( document ).ready() block.
    $( document ).ready(function() {
       $("#dataset").load("/JsonUsers");

        $( "#loading" ).hide();


        $( document ).ajaxStart(function() {
            $( "#loading" ).show();
        });


        $( document ).ajaxStop(function() {
            $( "#loading" ).hide("slow");
        });


    });

</script>


</html>