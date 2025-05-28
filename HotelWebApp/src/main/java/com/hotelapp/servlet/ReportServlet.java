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
import java.util.List;

@WebServlet("/reports")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the main reports page where users can select a report type
        request.getRequestDispatcher("reports.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (reportType == null || reportType.trim().isEmpty()) {
            request.setAttribute("reportError", "Please select a report type.");
            request.getRequestDispatcher("reports.jsp").forward(request, response);
            return;
        }

        try {
            switch (reportType) {
                case "dateRange":
                    String startDateStr = request.getParameter("startDate");
                    String endDateStr = request.getParameter("endDate");
                    if (startDateStr == null || startDateStr.isEmpty() || endDateStr == null || endDateStr.isEmpty()) {
                        request.setAttribute("reportError", "Start date and end date are required for this report.");
                        break;
                    }
                    Date startDate = sdf.parse(startDateStr);
                    Date endDate = sdf.parse(endDateStr);
                    if (endDate.before(startDate)) {
                        request.setAttribute("reportError", "End date cannot be before start date.");
                        break;
                    }
                    List<Reservation> dateRangeReservations = reservationDAO.getReservationsByDateRange(startDate, endDate);
                    request.setAttribute("reportTitle", "Reservations between " + startDateStr + " and " + endDateStr);
                    request.setAttribute("reservationsReport", dateRangeReservations);
                    break;

                case "frequentRooms":
                    String limitStr = request.getParameter("limit");
                    int limit = 5; // Default limit
                    if (limitStr != null && !limitStr.isEmpty()) {
                        try {
                            limit = Integer.parseInt(limitStr);
                            if (limit <=0) limit = 5;
                        } catch (NumberFormatException e) {
                            request.setAttribute("reportError", "Invalid limit for frequent rooms report.");
                            break;
                        }
                    }
                    List<Object[]> frequentRooms = reservationDAO.getMostFrequentlyBookedRooms(limit);
                    request.setAttribute("reportTitle", "Top " + limit + " Most Frequently Booked Rooms");
                    request.setAttribute("frequentRoomsReport", frequentRooms);
                    break;

                case "totalRevenue":
                    String revStartDateStr = request.getParameter("revStartDate");
                    String revEndDateStr = request.getParameter("revEndDate");
                     if (revStartDateStr == null || revStartDateStr.isEmpty() || revEndDateStr == null || revEndDateStr.isEmpty()) {
                        request.setAttribute("reportError", "Start date and end date are required for revenue report.");
                        break;
                    }
                    Date revStartDate = sdf.parse(revStartDateStr);
                    Date revEndDate = sdf.parse(revEndDateStr);
                     if (revEndDate.before(revStartDate)) {
                        request.setAttribute("reportError", "End date cannot be before start date for revenue report.");
                        break;
                    }
                    BigDecimal totalRevenue = reservationDAO.getTotalRevenueOverPeriod(revStartDate, revEndDate);
                    request.setAttribute("reportTitle", "Total Revenue between " + revStartDateStr + " and " + revEndDateStr);
                    request.setAttribute("totalRevenueReport", totalRevenue);
                    break;

                default:
                    request.setAttribute("reportError", "Invalid report type selected.");
                    break;
            }
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("reportError", "Invalid date format. Please use YYYY-MM-DD.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("reportError", "Database error while generating report: " + e.getMessage());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("reportError", "Invalid number format for report parameters.");
        }
        
        // Forward to a common result page or back to reports.jsp with results/errors
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}

