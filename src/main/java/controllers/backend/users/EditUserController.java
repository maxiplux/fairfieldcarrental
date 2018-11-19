package controllers.backend.users;

import models.User;
import service.LoginService;
import service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/EditUserController")
public class EditUserController extends HttpServlet {
    private LoginService loginService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));

        loginService=new LoginService();
        PrintWriter out=resp.getWriter();
        User user=loginService.getUserById(id);
        req.setAttribute("user",user);
        req.getRequestDispatcher("backend/users/editUser.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        RegisterService registerService=new RegisterService();

        //out.println("Welcome: "+ req.getParameter("firstname"));
        String fname=req.getParameter("firstname");
        String id=req.getParameter("id");
        String mname=req.getParameter("middlename");
        String lname=req.getParameter("lastname");
        String email=req.getParameter("email");

        email=email.toLowerCase();
        String pass=req.getParameter("password");

        User user=new User(fname,mname,lname,email,pass);
        user.setId((long) Integer.parseInt( id));

        registerService.register(user);

        String msg="User created successfully";




        resp.sendRedirect("/listUsersController");



    }
}
