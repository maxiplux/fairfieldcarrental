package controllers.backend.users;

import models.User;
import service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/newUserController")
public class NewUserController extends HttpServlet {

    RegisterService registerService=new RegisterService();
    private User user;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        //out.println("Welcome: "+ req.getParameter("firstname"));
        String fname=req.getParameter("firstname");
        String mname=req.getParameter("middlename");
        String lname=req.getParameter("lastname");
        String email=req.getParameter("email");
        email=email.toLowerCase();
        String pass=req.getParameter("password");

        user=new User(fname,mname,lname,email,pass);

        registerService.register(user);

        String msg="User created successfully";

        HttpSession session=req.getSession();


       // session.setAttribute("success",msg);

       /*req.getRequestDispatcher("backend/users/addUser.js")
                .forward(req,resp);*/
        out.println("<script type=\"text/javascript\">");
        out.println("alert('User created successfully');");
        out.println("location='backend/users/addUser.js';");
        out.println("</script>");


        resp.sendRedirect("/listUsersController");



    }
}
