<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Reservations</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script>
        function confirmDelete(reservationId) {
            if (confirm("Are you sure you want to delete reservation #" + reservationId + "?")) {
                window.location.href = "deleteReservation?id=" + reservationId + "&confirm=true";
            }
        }
    </script>
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
            <h2>Current Reservations</h2>

            <c:if test="${not empty successMessage}">
                <p class="message success-message"><c:out value="${successMessage}"/></p>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <p class="message error-message"><c:out value="${errorMessage}"/></p>
            </c:if>

            <c:choose>
                <c:when test="${not empty reservationsList}">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer Name</th>
                                <th>Room No.</th>
                                <th>Check-In</th>
                                <th>Check-Out</th>
                                <th>Total Amount</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reservation" items="${reservationsList}">
                                <tr>
                                    <td><c:out value="${reservation.reservationID}"/></td>
                                    <td><c:out value="${reservation.customerName}"/></td>
                                    <td><c:out value="${reservation.roomNumber}"/></td>
                                    <td><fmt:formatDate value="${reservation.checkInDate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${reservation.checkOutDate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatNumber value="${reservation.totalAmount}" type="currency" currencySymbol="$"/></td> <!-- Adjust currency symbol as needed -->
                                    <td>
                                        <a href="updateReservation?id=${reservation.reservationID}" class="action-link edit-link">Edit</a>
                                        <a href="#" onclick="confirmDelete(${reservation.reservationID})" class="action-link delete-link">Delete</a>
                                        <!-- Alternative for delete without JS confirmation, leading to confirmDelete.jsp -->
                                        <!-- <a href="deleteReservation?id=${reservation.reservationID}" class="action-link delete-link">Delete (Confirm)</a> -->
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>No reservations found.</p>
                </c:otherwise>
            </c:choose>
            
            <p><a href="addReservation" class="button-link">Add New Reservation</a></p>

        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
