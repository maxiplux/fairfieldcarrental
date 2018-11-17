package service;


import models.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class RegisterService {

    public boolean register(User user) {
        Session session = HibernateUtil.openSession();


        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(user);
            tx.commit();

            System.out.printf("<<<<# 33 -------> %s >>>>", user.toString());
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

    public boolean isUserExists(User user) {
        Session session = HibernateUtil.openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where userId='" + user.getUserId() + "'");
            User u = (User) query.uniqueResult();
            tx.commit();
            if (u != null) result = true;
        } catch (Exception ex) {
            System.out.printf("<<<< %s >>>>", ex.toString());
            if (tx != null) {
                tx.rollback();
            }
            return false;
        }
        return result;
    }
}