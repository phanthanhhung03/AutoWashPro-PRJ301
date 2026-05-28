
package dao;

import dto.Customer;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class CustomerDAO {

    public Customer getCustomer(String email, String password) {
        Customer result = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            // Step 1: Connect DB
            cn = dbutils.DBUtils.getConnection();

            if (cn != null) {

                // Step 2: SQL
                String sql = "SELECT CustomerID, FullName, PhoneNumber, Address, "
                        + "TierID, CurrentPoints, TotalBookings, TotalSpend, "
                        + "Status, CreatedAt "
                        + "FROM Customers "
                        + "WHERE Email = ? AND PasswordHash = ?";

                // Step 3
                st = cn.prepareStatement(sql);

                st.setString(1, email);
                st.setString(2, password);

                // Step 4
                System.out.println("DAO EMAIL = [" + email + "]");
                System.out.println("DAO PASSWORD = [" + password + "]");
                table = st.executeQuery();

                if (table.next()) {

                    result = new Customer();

                    result.setCusId(table.getInt("CustomerID"));
                    result.setFullName(table.getString("FullName"));
                    result.setPhoneNumber(table.getString("PhoneNumber"));
                    result.setEmail(email);
                    result.setAddress(table.getString("Address"));
                    result.setTierId(table.getInt("TierID"));
                    result.setCurrentPoint(table.getInt("CurrentPoints"));
                    result.setTotalBooking(table.getInt("TotalBookings"));
                    result.setTotalSpend(table.getInt("TotalSpend"));
                    result.setStatus(table.getBoolean("Status"));
                    result.setCreatedAt(table.getDate("CreatedAt"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

                if (table != null) {
                    table.close();
                }

                if (st != null) {
                    st.close();
                }

                if (cn != null) {
                    cn.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    
    public Customer getCustomer(String email) {
        Customer result = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            // Step 1: Connect DB
            cn = dbutils.DBUtils.getConnection();
            
            if (cn == null) System.out.println("not connect");

            if (cn != null) {

                // Step 2: SQL
                String sql = "SELECT CustomerID, FullName, PhoneNumber, Address, "
                        + "TierID, CurrentPoints, TotalBookings, TotalSpend, "
                        + "Status, CreatedAt "
                        + "FROM Customers "
                        + "WHERE Email = ?";

                // Step 3
                st = cn.prepareStatement(sql);

                st.setString(1, email);

                // Step 4
                table = st.executeQuery();

                if (table.next()) {

                    result = new Customer();

                    result.setCusId(table.getInt("CustomerID"));
                    result.setFullName(table.getString("FullName"));
                    result.setPhoneNumber(table.getString("PhoneNumber"));
                    result.setEmail(email);
                    result.setAddress(table.getString("Address"));
                    result.setTierId(table.getInt("TierID"));
                    result.setCurrentPoint(table.getInt("CurrentPoints"));
                    result.setTotalBooking(table.getInt("TotalBookings"));
                    result.setTotalSpend(table.getInt("TotalSpend"));
                    result.setStatus(table.getBoolean("Status"));
                    result.setCreatedAt(table.getDate("CreatedAt"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

                if (table != null) {
                    table.close();
                }

                if (st != null) {
                    st.close();
                }

                if (cn != null) {
                    cn.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
