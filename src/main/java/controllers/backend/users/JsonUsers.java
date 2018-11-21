package controllers.backend.users;

import models.User;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/JsonUsers")
public class JsonUsers extends HttpServlet {
    private List<User> users;
    private List<User> userList;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        LoginService loginService=new LoginService();
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

        try
        {
            Thread.sleep(1500);
        }
        catch(InterruptedException ex)
        {
            Thread.currentThread().interrupt();
        }


        req.getRequestDispatcher("/backend/users/XhtmlListUsers.jsp").forward(req,resp); //backend/users/ListUsers.jsp

    }
}
