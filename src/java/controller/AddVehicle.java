/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.VehicleDAO;
import dto.Customer;
import dto.Vehicle;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AddVehicle", urlPatterns = {"/AddVehicle"})
public class AddVehicle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String brand = request.getParameter("brand");
        String vehicleModel = toUpperCaseFirstChar(request.getParameter("vehicleModel"));
        String licensePlate = request.getParameter("licensePlate").toUpperCase();
        String color = toUpperCaseFirstChar(request.getParameter("color"));
        
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("USER");
        int cusId = customer.getCusId();
        
        Vehicle vehicle = new Vehicle();
        vehicle.setBrand(brand);
        vehicle.setColor(color);
        vehicle.setCustomerID(cusId);
        vehicle.setLicensePlate(licensePlate);
        vehicle.setModel(vehicleModel);
        
        VehicleDAO d = new VehicleDAO();
        int result = d.createVehicle(vehicle);
        
        if (result > 0) {
            response.getWriter().print("YES");
        } else {
            response.getWriter().print("NO");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String toUpperCaseFirstChar(String s) {
        if (s == null || s.trim().isEmpty()) {
            return null;
        } 
        
        s = s.toLowerCase();
        return Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }
}
