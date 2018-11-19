package controllers.backend.users;

import models.User;
import service.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class ListUsersController extends HttpServlet {

    private LoginService loginService=new LoginService();
    private List<User> users;
    private List<User> userList;



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out=resp.getWriter();
        String st="From List Users Controller";
        userList=new ArrayList<>();
        users=new ArrayList<>();

        users=loginService.getListOfUsers();

       /* for(User u:users){
            out.println(u);
        }*/

        req.setAttribute("users",users);
        req.setAttribute("message",st);

       // out.println(st);


        req.getRequestDispatcher("/backend/users/ListUsers.jsp").forward(req,resp); //backend/users/ListUsers.jsp

       /* RequestDispatcher dispatcher=req.getRequestDispatcher("ListUsers.jsp");
        dispatcher.forward(req,resp);*/


    }
}
