package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class HibernateUtil {


    private static SessionFactory sessionFactory;

    /* Reads hibernate.cfg.xml and prepares Hibernate for use     */
    protected static void setUp() throws Exception {
        // A SessionFactory is set up once for an application!
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure("hibernate.cfg.xml")
                .build();
        try {
            sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }

    protected static void tearDown() throws Exception {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }


    public static Session openSession() {
        try {
            setUp();
        } catch (Exception e) {
            System.out.print(">>>>>>>>>>>>");

            e.printStackTrace();
            System.out.printf("Errror %s <<<<<<<<", e.toString());
        }
        try {
            return sessionFactory.openSession();

        } catch (Exception e) {
            try {
                tearDown();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            try {
                setUp();
            } catch (Exception e1) {
                e1.printStackTrace();
            }

            return sessionFactory.openSession();
        }

    }
}