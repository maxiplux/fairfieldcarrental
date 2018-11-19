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
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" id="vehicles" href="/Vehicles">Vehicles


                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="users" href="/listUsersController">Users</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="operations" href="/Report">Operations</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" href="/Logout">Log out</a>
                    </li>
                    
                </ul>

            </div>
        </nav>
    </header>








    <!-- Begin page content -->
    <main role="main" class="container">


        <div class="row">

            <div class="col-4">
            </div>
            <div class="col-8">

                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th scope="row">#</th>
                            <th scope="col">Vehicle</th>
                            <th scope="col">Status</th>
                            <th scope="col">Client</th>
                            <th scope="col">Until</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Toyota</td>
                            <td>Rented</td>
                            <td>John Smith</td>
                            <td>Nov, 30 2018</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>BMW</td>
                            <td>Under Repair</td>
                            <td></td>
                            <td>Nov, 30 2018</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Mazda</td>
                            <td>Rented</td>
                            <td>Chris M.</td>
                            <td>Dec, 30 2018</td>
                        </tr>
                        <tr>
                                <th scope="row">4</th>
                                <td>Volswagen</td>
                                <td>Rented</td>
                                <td>Liza P.</td>
                                <td>Dec, 30 2018</td>
                            </tr>
                            <tr>
                                    <th scope="row">5</th>
                                    <td>Mercedes</td>
                                    <td>Rented</td>
                                    <td>Amber l.</td>
                                    <td>Dec, 30 2018</td>
                                </tr>
                                <tr>
                                        <th scope="row">6</th>
                                        <td>Chevrolet</td>
                                        <td>Rented</td>
                                        <td>Sally M.</td>
                                        <td>Dec, 30 2018</td>
                                    </tr>
                                    <tr>
                                            <th scope="row">7</th>
                                            <td>Station Wagen</td>
                                            <td>Rented</td>
                                            <td>Charles F.</td>
                                            <td>Dec, 30 2018</td>
                                        </tr>
                                        
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