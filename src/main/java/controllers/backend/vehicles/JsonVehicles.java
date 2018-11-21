package controllers.backend.vehicles;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.Vehicle;
import service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "JsonVehicles")
public class JsonVehicles extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
        VehicleService vehicleService = new VehicleService();
        PrintWriter out = response.getWriter();
        String pvehicle = request.getParameter("vehicle");
        Vehicle vehicle = objectMapper.readValue(pvehicle, Vehicle.class);
        vehicleService.create(vehicle);

        vehicle = vehicleService.getVehicleById(Math.toIntExact(vehicle.getId()));

        out.print(objectMapper.writeValueAsString(vehicle));
        out.flush();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        VehicleService vehicleService = new VehicleService();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String pvehicle = request.getParameter("vehicle");
        Vehicle vehicle = objectMapper.readValue(pvehicle, Vehicle.class);
        out.print(mapper.writeValueAsString(vehicleService.getVehicleById(Math.toIntExact(vehicle.getId()))));
        out.flush();

    }
}
