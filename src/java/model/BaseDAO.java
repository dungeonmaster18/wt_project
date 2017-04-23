/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author umesh
 */
public class BaseDAO {

    Connection con = null;

    public Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDCD","postgres", "9892");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;

    }

    public void closeConnection() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
