package models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.concurrent.TimeUnit;

@Entity
public class Operation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private Vehicle vehicle;

    private float price; // Price by date not hours

    @DateTimeFormat(pattern = "dd-mm-yyyy")
    private Date date_start;

    @DateTimeFormat(pattern = "dd-mm-yyyy")
    private Date date_end;

    public Operation() {
    }

    public Operation(User user, Vehicle vehicle,  String date_start, String date_end) {
        this.user = user;
        this.vehicle = vehicle;


        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        try {
            this.date_start = formatter.parse(date_start);
            this.date_end = formatter.parse(date_end);

            long diff = this.date_end.getTime() - this.date_start.getTime() ;

            this.price = vehicle.getPrice()  *TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);;
        }
        catch (Exception e) {
            e.printStackTrace();

            System.out.println(e.toString());
        }
    }

    @Override
    public String toString() {
        return "Operation{" +
                "id=" + id +
                ", user=" + user.toString() +
                ", vehicle=" + vehicle.toString() +
                ", price=" + price +
                ", date_start=" + date_start +
                ", date_end=" + date_end +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }
}