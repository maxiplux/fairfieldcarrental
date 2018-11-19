package service;


import models.Vehicle;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class VehicleService {


    public Vehicle create(Vehicle vehicle) {
        Session session = HibernateUtil.openSession();


        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(vehicle);
            tx.commit();

            System.out.printf("<<<<# 33 -------> %s >>>>", vehicle.toString());
        } catch (Exception e) {


            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();

            System.out.printf("<<<<# 44 %s >>>>", e.toString());
            return vehicle;
        }

        return vehicle;
    }


    public Vehicle getVehicleById(Integer id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Vehicle user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Vehicle where id=" + id);
            user = (Vehicle) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            System.out.printf("<<<< %s >>>>", e.toString());
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }

    public List<Vehicle> getListOfVehicles() {
        List<Vehicle> list = new ArrayList<Vehicle>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Vehicle ").list();

            System.out.printf("<<<<@@@@ %s >>>>", list.toString());
            tx.commit();
        } catch (Exception e) {
            System.out.printf("<<<< %s >>>>", e.toString());
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }

        return list;
    }
}
