package service;


import models.Operation;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class OperationService {


    public boolean create(Operation object) {
        Session session = HibernateUtil.openSession();


        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(object);
            tx.commit();

            System.out.printf("<<<<# 33 -------> %s >>>>", object.toString());
        } catch (Exception e) {


            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();

            System.out.printf("<<<<# 44 %s >>>>", e.toString());
            return false;
        }

        return true;
    }


    public Operation getOpeationById(String id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Operation operation = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Operation where id=" + id);
            operation = (Operation) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            System.out.printf("<<<< %s >>>>", e.toString());
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return operation;
    }

    public List<Operation> getListOfOperations() {
        List<Operation> list = new ArrayList<Operation>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Operation").list();

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
