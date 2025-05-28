package com.hotelapp.servlet;

import com.hotelapp.dao.ReservationDAO;
import com.hotelapp.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/displayReservations")
public class DisplayReservationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Reservation> reservations = reservationDAO.getAllReservations();
            request.setAttribute("reservationsList", reservations);
            
            // Forward success/error messages from other servlets if they exist
            String successMessage = request.getParameter("successMessage");
            if (successMessage != null && !successMessage.isEmpty()) {
                request.setAttribute("successMessage", successMessage);
            }
            String errorMessage = request.getParameter("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
                request.setAttribute("errorMessage", errorMessage);
            }
            
            request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace(); // Log this error
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response); // Generic error page
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Typically, display operations are handled by doGet
        doGet(request, response);
    }
}

