<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Reservation</title>
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
            <h2>Add New Reservation</h2>

            <c:if test="${not empty errorMessage}">
                <p class="message error-message"><c:out value="${errorMessage}"/></p>
            </c:if>

            <form action="addReservation" method="post" class="styled-form">
                <div>
                    <label for="customerName">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" value="<c:out value='${param.customerName}'/>" required>
                </div>
                <div>
                    <label for="roomNumber">Room Number:</label>
                    <input type="text" id="roomNumber" name="roomNumber" value="<c:out value='${param.roomNumber}'/>" required>
                </div>
                <div>
                    <label for="checkInDate">Check-In Date:</label>
                    <input type="date" id="checkInDate" name="checkInDate" value="<c:out value='${param.checkInDate}'/>" required>
                </div>
                <div>
                    <label for="checkOutDate">Check-Out Date:</label>
                    <input type="date" id="checkOutDate" name="checkOutDate" value="<c:out value='${param.checkOutDate}'/>" required>
                </div>
                <div>
                    <label for="totalAmount">Total Amount:</label>
                    <input type="number" id="totalAmount" name="totalAmount" step="0.01" min="0" value="<c:out value='${param.totalAmount}'/>" required>
                </div>
                <div>
                    <button type="submit">Add Reservation</button>
                    <button type="reset">Clear</button>
                </div>
            </form>
        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
