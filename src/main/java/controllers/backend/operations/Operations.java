package controllers.backend.operations;

import models.Vehicle;
import service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/rentals")
public class Operations extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VehicleService vehicleService = new VehicleService();
        final List<Vehicle> listOfVehicles = vehicleService.getListOfVehicles();

        req.setAttribute("vehicles", listOfVehicles);
        req.getRequestDispatcher("/frontend/index.jsp").forward(req, resp);
    }
}
