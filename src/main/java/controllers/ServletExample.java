package controllers;

import models.Operation;
import models.User;
import models.Vehicle;
import service.LoginService;
import service.OperationService;
import service.RegisterService;
import service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "/ServletExample")
public class ServletExample extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        LoginService loginService = new LoginService();

        VehicleService  vehicleService = new VehicleService();
        Vehicle vh= new Vehicle("Mazda","GT",100);
        Boolean status_vehicle=vehicleService.create(vh);


        for (Vehicle vehicle : vehicleService.getListOfVehicles()) {

            out.println("i am on a vehicle");
            out.println(vehicle.toString());

        }




        out.printf("Status about Vehicles %s %s" , status_vehicle,vh);


        for (int i = 0; i < 10; i++) {

            User userTest = new User("Juan", "Mosquera", "Hurtado", "Maxiplux@gmail.com", "Juan Juan");


            RegisterService registerService = new RegisterService();
            boolean result = registerService.register(userTest);

            out.println(result);
            out.println(userTest.toString());

        }


        for (Vehicle vh1 : vehicleService.getListOfVehicles()) {

            out.println("I am on Vehicle");
            out.println(vh1.toString());

        }


        Operation operation = new Operation(loginService.getUserById(1), vehicleService.getVehicleById(84) ,"07-11-2013" ,"07-12-2013" );

        OperationService operationService= new OperationService();
        operationService.create(operation);

        out.println("Well we have an operation");
        operationService.getListOfOperations().forEach((  Operation operationf ) -> {



            out.println(  operationf.toString() );

        });

    }
}
