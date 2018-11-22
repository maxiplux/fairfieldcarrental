package controllers.backend.operations;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.Operation;
import models.User;
import models.Vehicle;
import service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/JsonOperation")
public class JsonOperation extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);

        VehicleService vehicleService = new VehicleService();

        PrintWriter out =resp.getWriter();

        String pvehicle = req.getParameter("id");
        String startdate = req.getParameter("startdate");
        String enddate = req.getParameter("enddate");

        Vehicle vehicle = vehicleService.getVehicleById( Integer.parseInt (pvehicle));

        Operation operation = new Operation(new User(), vehicle, startdate, enddate);

        out.print(objectMapper.writeValueAsString(operation));
        out.flush();

    }
}
