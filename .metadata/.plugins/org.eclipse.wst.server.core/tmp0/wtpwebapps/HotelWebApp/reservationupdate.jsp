<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
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
            <h2>Update Reservation</h2>

            <c:if test="${not empty errorMessage}">
                <p class="message error-message"><c:out value="${errorMessage}"/></p>
            </c:if>

            <c:if test="${not empty reservation}">
                <form action="updateReservation" method="post" class="styled-form">
                    <input type="hidden" name="reservationID" value="<c:out value=\'${reservation.reservationID}\'/>">
                    <div>
                        <label for="customerName">Customer Name:</label>
                        <input type="text" id="customerName" name="customerName" value="<c:out value=\'${reservation.customerName}\'/>" required>
                    </div>
                    <div>
                        <label for="roomNumber">Room Number:</label>
                        <input type="text" id="roomNumber" name="roomNumber" value="<c:out value=\'${reservation.roomNumber}\'/>" required>
                    </div>
                    <div>
                        <label for="checkInDate">Check-In Date:</label>
                        <fmt:formatDate value="${reservation.checkInDate}" pattern="yyyy-MM-dd" var="fmtCheckInDate" />
                        <input type="date" id="checkInDate" name="checkInDate" value="<c:out value=\'${fmtCheckInDate}\'/>" required>
                    </div>
                    <div>
                        <label for="checkOutDate">Check-Out Date:</label>
                        <fmt:formatDate value="${reservation.checkOutDate}" pattern="yyyy-MM-dd" var="fmtCheckOutDate" />
                        <input type="date" id="checkOutDate" name="checkOutDate" value="<c:out value=\'${fmtCheckOutDate}\'/>" required>
                    </div>
                    <div>
                        <label for="totalAmount">Total Amount:</label>
                        <input type="number" id="totalAmount" name="totalAmount" step="0.01" min="0" value="<c:out value=\'${reservation.totalAmount}\'/>" required>
                    </div>
                    <div>
                        <button type="submit">Update Reservation</button>
                        <a href="displayReservations" class="button-link">Cancel</a>
                    </div>
                </form>
            </c:if>
            <c:if test="${empty reservation}">
                <p>Reservation details not found. <a href="displayReservations">Go back to list</a>.</p>
            </c:if>

        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
