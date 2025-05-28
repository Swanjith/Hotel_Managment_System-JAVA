<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Reports</title>
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
            <h2>Generate Reports</h2>

            <c:if test="${not empty reportError}">
                <p class="message error-message"><c:out value="${reportError}"/></p>
            </c:if>

            <form action="reports" method="post" class="styled-form report-form">
                <h3>Reservations by Date Range</h3>
                <div>
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate">
                </div>
                <div>
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate">
                </div>
                <div>
                    <button type="submit" name="reportType" value="dateRange">Generate Date Range Report</button>
                </div>
            </form>

            <hr class="form-divider">

            <form action="reports" method="post" class="styled-form report-form">
                <h3>Most Frequently Booked Rooms</h3>
                <div>
                    <label for="limit">Number of Rooms to Display (Top N):</label>
                    <input type="number" id="limit" name="limit" min="1" value="5">
                </div>
                <div>
                    <button type="submit" name="reportType" value="frequentRooms">Generate Frequent Rooms Report</button>
                </div>
            </form>
            
            <hr class="form-divider">

            <form action="reports" method="post" class="styled-form report-form">
                <h3>Total Revenue Over a Period</h3>
                 <div>
                    <label for="revStartDate">Start Date:</label>
                    <input type="date" id="revStartDate" name="revStartDate">
                </div>
                <div>
                    <label for="revEndDate">End Date:</label>
                    <input type="date" id="revEndDate" name="revEndDate">
                </div>
                <div>
                    <button type="submit" name="reportType" value="totalRevenue">Generate Total Revenue Report</button>
                </div>
            </form>

        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
