package controllers.backend.operations;

import models.Operation;
import models.User;
import models.Vehicle;
import service.LoginService;
import service.OperationService;
import service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet({"/rentals","/rentals-create/","/rentals-pay/"})
public class Operations extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VehicleService vehicleService = new VehicleService();
        final List<Vehicle> listOfVehicles = vehicleService.getListOfVehicles();

        req.setAttribute("vehicles", listOfVehicles);
        req.getRequestDispatcher("/frontend/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperationService operationService = new OperationService();
        VehicleService vehicleService = new VehicleService();
        LoginService loginServce = new LoginService();

        String vehicleId = req.getParameter("id");
        String option = req.getParameter("option");
        final Vehicle vehicle = vehicleService.getVehicleById(Integer.parseInt(vehicleId));
        req.setAttribute("vehicle", vehicle);

        if ("rent".equals(option)) {

            HttpSession session=req.getSession();
            User user= (User) session.getAttribute("user");


            String startdate = req.getParameter("startdate");
            String enddate = req.getParameter("enddate");







            Operation operation = new Operation(user, vehicle,  startdate, enddate);

            operationService.create(operation);
            req.getRequestDispatcher("/frontend/confirm.jsp").forward(req, resp);
        }

        else if ("confirm".equals(option))
        {
            req.getRequestDispatcher("/frontend/payment.jsp").forward(req, resp);
        }

        else if ("payment".equals(option))
        {
            resp.sendRedirect("/rentals-pay/");
        }



        else {
            //resp.sendRedirect("/rentals");

            req.getRequestDispatcher("/frontend/operation.jsp").forward(req, resp);
        }

    }
}
