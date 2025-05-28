package com.hotelapp.servlet;

import com.hotelapp.dao.ReservationDAO;
import com.hotelapp.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/updateReservation")
public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect("displayReservations?errorMessage=Reservation ID is missing for update.");
            return;
        }

        try {
            int reservationId = Integer.parseInt(idStr);
            Reservation existingReservation = reservationDAO.getReservationById(reservationId);
            if (existingReservation != null) {
                request.setAttribute("reservation", existingReservation);
                request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
            } else {
                response.sendRedirect("displayReservations?errorMessage=Reservation not found for ID: " + reservationId);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("displayReservations?errorMessage=Invalid Reservation ID format.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("reservationID");
        String customerName = request.getParameter("customerName");
        String roomNumber = request.getParameter("roomNumber");
        String checkInStr = request.getParameter("checkInDate");
        String checkOutStr = request.getParameter("checkOutDate");
        String totalAmountStr = request.getParameter("totalAmount");

        // Basic Input Validation
        if (idStr == null || idStr.trim().isEmpty() ||
            customerName == null || customerName.trim().isEmpty() ||
            roomNumber == null || roomNumber.trim().isEmpty() ||
            checkInStr == null || checkInStr.trim().isEmpty() ||
            checkOutStr == null || checkOutStr.trim().isEmpty() ||
            totalAmountStr == null || totalAmountStr.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required.");
            // Repopulate form with existing data if possible or redirect
            doGet(request, response); // Re-show the form with error
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = null;
        Date checkOutDate = null;
        BigDecimal totalAmount = null;
        int reservationId = 0;

        try {
            reservationId = Integer.parseInt(idStr);
            checkInDate = sdf.parse(checkInStr);
            checkOutDate = sdf.parse(checkOutStr);
            totalAmount = new BigDecimal(totalAmountStr);

            if (checkOutDate.before(checkInDate)) {
                request.setAttribute("errorMessage", "Check-out date cannot be before check-in date.");
                Reservation existingReservation = reservationDAO.getReservationById(reservationId); // Fetch again to repopulate
                request.setAttribute("reservation", existingReservation);
                request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
                return;
            }
             if (totalAmount.compareTo(BigDecimal.ZERO) < 0) {
                 request.setAttribute("errorMessage", "Total amount cannot be negative.");
                 Reservation existingReservation = reservationDAO.getReservationById(reservationId);
                 request.setAttribute("reservation", existingReservation);
                 request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
                return;
            }
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid date format. Please use YYYY-MM-DD.");
            doGet(request, response);
            return;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid ID or total amount format.");
            doGet(request, response);
            return;
        } catch (SQLException e) {
            e.printStackTrace();
             request.setAttribute("errorMessage", "Error fetching reservation for update form: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Reservation reservation = new Reservation(reservationId, customerName, roomNumber, checkInDate, checkOutDate, totalAmount);

        try {
            boolean success = reservationDAO.updateReservation(reservation);
            if (success) {
                response.sendRedirect("displayReservations?successMessage=Reservation updated successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to update reservation. Please try again.");
                request.setAttribute("reservation", reservation); // Send back the object to repopulate form
                request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error during update: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

