<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Hotel Reservation Management</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="addReservation">Add Reservation</a></li>
                    <li><a href="displayReservations">View Reservations</a></li>
                    <li><a href="reports">Reports</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Report Results: <c:out value="${reportTitle}"/></h2>

            <c:if test="${not empty reportError}">
                <p class="message error-message"><c:out value="${reportError}"/></p>
            </c:if>

            <%-- Report for Reservations by Date Range --%>
            <c:if test="${not empty reservationsReport}">
                <h3>Reservations</h3>
                <c:choose>
                    <c:when test="${not empty reservationsReport[0]}"> <%-- Check if list is not empty --%>
                        <table class="styled-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer Name</th>
                                    <th>Room No.</th>
                                    <th>Check-In</th>
                                    <th>Check-Out</th>
                                    <th>Total Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="reservation" items="${reservationsReport}">
                                    <tr>
                                        <td><c:out value="${reservation.reservationID}"/></td>
                                        <td><c:out value="${reservation.customerName}"/></td>
                                        <td><c:out value="${reservation.roomNumber}"/></td>
                                        <td><fmt:formatDate value="${reservation.checkInDate}" pattern="yyyy-MM-dd"/></td>
                                        <td><fmt:formatDate value="${reservation.checkOutDate}" pattern="yyyy-MM-dd"/></td>
                                        <td><fmt:formatNumber value="${reservation.totalAmount}" type="currency" currencySymbol="$"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No reservations found for the selected criteria.</p>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <%-- Report for Most Frequently Booked Rooms --%>
            <c:if test="${not empty frequentRoomsReport}">
                <h3>Most Frequently Booked Rooms</h3>
                 <c:choose>
                    <c:when test="${not empty frequentRoomsReport[0]}">
                        <table class="styled-table">
                            <thead>
                                <tr>
                                    <th>Room Number</th>
                                    <th>Booking Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="roomData" items="${frequentRoomsReport}">
                                    <tr>
                                        <td><c:out value="${roomData[0]}"/></td> <%-- RoomNumber --%>
                                        <td><c:out value="${roomData[1]}"/></td> <%-- BookingCount --%>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                         <p>No booking data available for frequent rooms report.</p>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <%-- Report for Total Revenue --%>
            <c:if test="${not empty totalRevenueReport}">
                <h3>Total Revenue</h3>
                <p class="report-summary">Total Revenue Generated: 
                    <strong><fmt:formatNumber value="${totalRevenueReport}" type="currency" currencySymbol="$"/></strong>
                </p>
            </c:if>
            
            <c:if test="${empty reservationsReport && empty frequentRoomsReport && empty totalRevenueReport && empty reportError}">
                <p>No report data to display. Please generate a report from the <a href="reports">Reports page</a>.</p>
            </c:if>

            <p><a href="reports" class="button-link">Back to Reports Selection</a></p>

        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
