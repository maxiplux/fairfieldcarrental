$(function(){
    $('#createUser').click(addUser);

    function addUser(){
        var firstName = $('#firstname').val();
        var middleName = $('#middlename').val();
        var lastName = $('#lastname').val();
        var emailAdd = $('#email').val();
        var pass = $('#password').val();

        var user={firstname:firstName,middlename: middleName,lastname:lastName,email:emailAdd,password:pass };
        $.post("/newUserController",user)
            .done(added)
            .fail(failed);
    }

    function added() {
        alert("User created successfully");

    }

    function failed() {
        alert("Add operation failed");

    }


})