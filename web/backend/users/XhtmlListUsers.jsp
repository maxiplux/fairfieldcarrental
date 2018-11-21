<%--
  Created by IntelliJ IDEA.
  User: juan
  Date: 11/21/18
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
