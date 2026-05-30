
package controller;

import dao.CustomerDAO;
import dto.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Lấy thông tin từ form 
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // VALIDATE: Kiểm tra rỗng và khoảng trắng
            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.setAttribute("ERROR", "Vui lòng nhập đầy đủ Email và Mật khẩu!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return; // Chặn lại ngay lập tức, không gọi Database
            }

            // TỐI ƯU UX: Dọn dẹp khoảng trắng thừa do copy-paste ở ô Email
            email = email.trim(); 
            
            CustomerDAO d = new CustomerDAO();
            Customer customer = d.getCustomer(email, password);

            // Xử lý khi không tìm thấy tài khoản hoặc sai mật khẩu
            if (customer == null) {
                request.setAttribute("ERROR", "Email hoặc mật khẩu không chính xác!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return; 
            } 

            // Xử lý khi tài khoản bị khóa
            if (!customer.isStatus()) {
                request.setAttribute("ERROR", "Tài khoản của bạn đã bị khóa hoặc từ chối truy cập!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            // Đăng nhập thành công
            request.getSession().setAttribute("USER", customer);
            response.sendRedirect("dashboard.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("ERROR", "Hệ thống đang gặp sự cố, vui lòng thử lại sau!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
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

}
