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

@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String confirmDelete = request.getParameter("confirm"); // Check if confirmation is given

        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect("displayReservations?errorMessage=Reservation ID is missing for deletion.");
            return;
        }

        try {
            int reservationId = Integer.parseInt(idStr);

            if ("true".equals(confirmDelete)) { // If confirmed, proceed with deletion
                boolean success = reservationDAO.deleteReservation(reservationId);
                if (success) {
                    response.sendRedirect("displayReservations?successMessage=Reservation deleted successfully!");
                } else {
                    // This case might happen if the record was already deleted by another user, or DB constraint issue
                    response.sendRedirect("displayReservations?errorMessage=Failed to delete reservation with ID: " + reservationId + ". It might have been already deleted or an issue occurred.");
                }
            } else {
                // If not confirmed, show a confirmation page or redirect to display with a confirmation prompt
                // For simplicity, we'll redirect to displayReservations which can show a confirmation modal (if implemented in JSP)
                // Or, forward to a specific confirmation JSP page:
                Reservation reservation = reservationDAO.getReservationById(reservationId);
                if (reservation != null) {
                    request.setAttribute("reservationToDelete", reservation);
                    request.getRequestDispatcher("confirmDelete.jsp").forward(request, response); // A new JSP for confirmation
                } else {
                     response.sendRedirect("displayReservations?errorMessage=Reservation not found for ID: " + reservationId + " to confirm deletion.");
                }
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("displayReservations?errorMessage=Invalid Reservation ID format for deletion.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error during deletion: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    // doPost could be used if the confirmation form submits via POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This could handle the actual deletion after a POST confirmation, similar to doGet with confirm=true
        String idStr = request.getParameter("reservationID"); // Assuming ID is passed from a confirmation form
         if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect("displayReservations?errorMessage=Reservation ID is missing for deletion confirmation.");
            return;
        }
        try {
            int reservationId = Integer.parseInt(idStr);
            boolean success = reservationDAO.deleteReservation(reservationId);
            if (success) {
                response.sendRedirect("displayReservations?successMessage=Reservation deleted successfully!");
            } else {
                response.sendRedirect("displayReservations?errorMessage=Failed to delete reservation with ID: " + reservationId + ". It might have been already deleted or an issue occurred.");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("displayReservations?errorMessage=Invalid Reservation ID format for deletion confirmation.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error during deletion confirmation: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

