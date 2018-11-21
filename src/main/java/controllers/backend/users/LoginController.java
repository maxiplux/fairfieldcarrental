package controllers.backend.users;

import service.LoginService;
import service.RegisterService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        //out.println("weclome: "+ req.getParameter("email"));
        LoginService loginService= new LoginService();

        String emailAdd=req.getParameter("email");
        String pass=req.getParameter("password");


        if ( "admin@admin.com".equals(emailAdd)  && "adminadmin".equals(pass) )

        {

            HttpSession session=req.getSession();
            User user = new User();
            user.setEmail( "admin@admin.com");
            user.setId((long) -1);
            session.setAttribute("user",user);
            resp.sendRedirect("/Vehicles");

        }
        else if ( loginService.authenticateUser(emailAdd,pass) )

        {
            HttpSession session=req.getSession();
            session.setAttribute("user",loginService.getUserByEmail(emailAdd));
            resp.sendRedirect("/rentals");
            out.println("Success: "+ emailAdd + " Autneticated");
        }
        else {
            resp.sendRedirect("backend/login.jsp");
        }





        /*if(true){
            out.println("Success: "+ email + " Autneticated");
           // resp.sendRedirect("backend/dashboard.jsp");
        }
        else {
            resp.sendRedirect("backend/login.jsp");
        }
*/
    }
}
