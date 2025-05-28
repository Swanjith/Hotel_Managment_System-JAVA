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

@WebServlet("/addReservation")
public class AddReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String roomNumber = request.getParameter("roomNumber");
        String checkInStr = request.getParameter("checkInDate");
        String checkOutStr = request.getParameter("checkOutDate");
        String totalAmountStr = request.getParameter("totalAmount");

        // Basic Input Validation (More robust validation should be added)
        if (customerName == null || customerName.trim().isEmpty() ||
            roomNumber == null || roomNumber.trim().isEmpty() ||
            checkInStr == null || checkInStr.trim().isEmpty() ||
            checkOutStr == null || checkOutStr.trim().isEmpty() ||
            totalAmountStr == null || totalAmountStr.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = null;
        Date checkOutDate = null;
        BigDecimal totalAmount = null;

        try {
            checkInDate = sdf.parse(checkInStr);
            checkOutDate = sdf.parse(checkOutStr);
            totalAmount = new BigDecimal(totalAmountStr);
            
            if (checkOutDate.before(checkInDate)) {
                request.setAttribute("errorMessage", "Check-out date cannot be before check-in date.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
                return;
            }
            if (totalAmount.compareTo(BigDecimal.ZERO) < 0) {
                 request.setAttribute("errorMessage", "Total amount cannot be negative.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
                return;
            }

        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid date format. Please use YYYY-MM-DD.");
            request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
            return;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid total amount. Please enter a valid number.");
            request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
            return;
        }

        Reservation reservation = new Reservation();
        reservation.setCustomerName(customerName);
        reservation.setRoomNumber(roomNumber);
        reservation.setCheckInDate(checkInDate);
        reservation.setCheckOutDate(checkOutDate);
        reservation.setTotalAmount(totalAmount);

        try {
            boolean success = reservationDAO.addReservation(reservation);
            if (success) {
                response.sendRedirect("displayReservations"); // Redirect to display page
            } else {
                request.setAttribute("errorMessage", "Failed to add reservation. Please try again.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log this error
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response); // Generic error page
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the add reservation form
        request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
    }
}

