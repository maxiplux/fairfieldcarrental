
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:forEach items="${users}" var="user1">
    <tr>

        <td>${user1.id}</td>
        <td>${user1.firstName}</td>
        <td>${user1.middleName}</td>
        <td>${user1.lastName}</td>
        <td>${user1.email}</td>

        <td><a  class="btn btn-primary"  href="/EditUserController?id=${user1.id}">Edit</a></td>

    </tr>
    </c:forEach>

    </tr>

    </tbody>
</table>
