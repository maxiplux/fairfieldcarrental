var vehicle = document.getElementById('vehicles');
vehicle.addEventListener("click", vehiclesReport);


var user = document.getElementById('users');
user.addEventListener("click", usersReport);


var operation = document.getElementById('operations');
operation.addEventListener("click", operationsReport);


function vehiclesReport() {
    alert("Vehicle Report");

}

function usersReport() {
    alert("Users Report");

}

function operationsReport() {
    alert("Operations Report");

}