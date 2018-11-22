<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 11/16/2018
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>My MUM Rentals</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="/frontend/rentals.css"/>
    <script src="/frontend/rentals.js"></script>
</head>
<body>

<div class="header">
    <a href="#default" class="logo">MUM Rentals</a>
    <div class="header-right">
        <a class="active" href="/">Home</a>
        <c:if test="${user.email!=null}">
            <a href="/Logout">(${user.email}) Logout</a>
        </c:if>
    </div>
</div>

<section class="card-container">

    <form action="/rentals" method="post">
        <input name="id" type="hidden" value="${vehicle.id}">
        <input name="option" type="hidden" value="confirm">
        <article class="card">
            <header class="card__title">
                <h3>Confirm Car Rental?</h3>
            </header>
            <figure class="card__thumbnail">
                <img src="images/${vehicle.image}.jpg" width="150" align="center" height="50">
            </figure>

            <main class="card__description">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            Name:
                        </div>
                        <div class="col-sm">
                            ${vehicle.name}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Make:
                        </div>
                        <div class="col-sm">
                            ${vehicle.mak}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Color:
                        </div>
                        <div class="col-sm">
                            ${vehicle.mak}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Model:
                        </div>
                        <div class="col-sm">
                            ${vehicle.model}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Price per day:
                        </div>
                        <div class="col-sm">
                            ${vehicle.price}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Start Date:
                        </div>
                        <div class="col-sm">
                            <fmt:formatDate value="${operation.date_start}" pattern="MM-dd-yyyy" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            End Date:
                        </div>
                        <div class="col-sm">
                            <fmt:formatDate value="${operation.date_end}" pattern="MM-dd-yyyy" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            Total Price:
                        </div>
                        <div class="col-sm">
                            ${operation.price}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <div class="error-msg alert alert-danger d-none" role="alert">

                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <input type="submit" class="button" value="Confirm">
        </article>
    </form>
</section>
</body>
</html>