package service;


import models.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class LoginService {

    public boolean authenticateUser(String email, String password) {
        User user = getUserByEmail(email);
        return  user.getPassword().equals(password);
    }

    public User getUserByEmail(String email) {
        email=email.toLowerCase();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery( String.format(" from User where email=  '%s'",email));
            user = (User) query.uniqueResult();
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

    public User getUserById(Integer userId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where id=" + userId + "");
            user = (User) query.uniqueResult();
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

    public List<User> getListOfUsers() {
        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();

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
