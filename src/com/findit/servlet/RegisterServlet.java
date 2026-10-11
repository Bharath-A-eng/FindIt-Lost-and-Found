package com.findit.servlet;

import com.findit.dao.UserDAO;
import com.findit.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {

            response.sendRedirect("login.jsp");

        } else {

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();

            out.println("<html>");
            out.println("<head><title>Registration Failed</title></head>");
            out.println("<body>");
            out.println("<h2 style='color:red;'>Email already registered!</h2>");
            out.println("<p>Please use another email or login with your existing account.</p>");
            out.println("<br>");
            out.println("<a href='register.jsp'>Back to Register</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}