<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Reservation</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Embedded CSS - No external file needed -->
    <style>
        /* Import Google Fonts */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;700&display=swap");

        /* CSS Variables for consistent theming */
        :root {
          --primary-color: #1e3a8a;
          --secondary-color: #3b82f6;
          --accent-color: #f59e0b;
          --light-color: #f3f4f6;
          --dark-color: #1f2937;
          --success-color: #10b981;
          --danger-color: #ef4444;
          --warning-color: #f59e0b;
          --info-color: #3b82f6;
          --box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
          --transition: all 0.3s ease;
        }

        /* Reset and Base Styles */
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        html, body {
          height: 100%;
          width: 100%;
          overflow-x: hidden;
        }

        body {
          font-family: "Poppins", sans-serif;
          line-height: 1.6;
          color: var(--dark-color);
          background-color: #f9fafb;
          background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          background-attachment: fixed;
          background-size: cover;
        }

        .container {
          width: 100%;
          min-height: 100vh;
          display: flex;
          flex-direction: column;
        }

        /* Enhanced Header Styles */
        header {
          background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
          color: white;
          padding: 1.5rem 0;
          box-shadow: var(--box-shadow);
          position: relative;
          z-index: 10;
          width: 100%;
        }

        header::before {
          content: "";
          position: absolute;
          bottom: -10px;
          left: 0;
          right: 0;
          height: 10px;
          background: linear-gradient(45deg, transparent 33.33%, var(--light-color) 33.33%, var(--light-color) 66.66%, transparent 66.66%);
          background-size: 20px 20px;
          z-index: 5;
        }

        header h1 {
          font-family: "Playfair Display", serif;
          text-align: center;
          margin: 0;
          font-size: 2.5rem;
          font-weight: 700;
          text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
          letter-spacing: 1px;
          padding-bottom: 0.5rem;
          animation: fadeInDown 1s ease-out;
        }

        /* Modern Navigation */
        header nav {
          text-align: center;
          padding-top: 1rem;
        }

        header nav ul {
          padding: 0;
          list-style: none;
          display: flex;
          justify-content: center;
          flex-wrap: wrap;
        }

        header nav ul li {
          margin: 0 5px;
          position: relative;
          animation: fadeInUp 0.5s ease-out;
          animation-fill-mode: both;
        }

        header nav ul li:nth-child(1) {
          animation-delay: 0.1s;
        }

        header nav ul li:nth-child(2) {
          animation-delay: 0.2s;
        }

        header nav ul li:nth-child(3) {
          animation-delay: 0.3s;
        }

        header nav ul li:nth-child(4) {
          animation-delay: 0.4s;
        }

        header nav a {
          color: white;
          text-decoration: none;
          text-transform: uppercase;
          font-size: 0.9rem;
          font-weight: 500;
          letter-spacing: 1px;
          padding: 10px 15px;
          border-radius: 4px;
          transition: var(--transition);
          display: inline-block;
          position: relative;
        }

        header nav a::after {
          content: "";
          position: absolute;
          width: 0;
          height: 2px;
          bottom: 0;
          left: 50%;
          background-color: white;
          transition: var(--transition);
          transform: translateX(-50%);
        }

        header nav a:hover {
          color: var(--accent-color);
          transform: translateY(-3px);
        }

        header nav a:hover::after {
          width: 80%;
        }

        header nav a.active {
          background-color: rgba(255, 255, 255, 0.2);
        }

        /* Enhanced Main Content Styles */
        main {
          background: white;
          border-radius: 10px;
          margin: 2rem auto;
          padding: 2rem;
          box-shadow: var(--box-shadow);
          position: relative;
          overflow: hidden;
          width: 90%;
          max-width: 800px; /* Adjusted max-width for forms */
          flex: 1;
          animation: fadeIn 1s ease-out;
        }

        main::before {
          content: "";
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 5px;
          background: linear-gradient(to right, var(--primary-color), var(--secondary-color), var(--accent-color));
        }

        main h2 {
          font-family: "Playfair Display", serif;
          color: var(--primary-color);
          text-align: center;
          margin-bottom: 1.5rem;
          font-size: 2rem;
          position: relative;
          padding-bottom: 10px;
          animation: fadeInDown 0.8s ease-out;
        }

        main h2::after {
          content: "";
          position: absolute;
          bottom: 0;
          left: 50%;
          transform: translateX(-50%);
          width: 80px;
          height: 3px;
          background: var(--accent-color);
          animation: widthGrow 1s ease-out forwards;
        }

        @keyframes widthGrow {
          from { width: 0; }
          to { width: 80px; }
        }

        /* Enhanced Footer */
        footer {
          text-align: center;
          padding: 1.5rem 0;
          background: var(--dark-color);
          color: white;
          width: 100%;
          position: relative;
        }

        footer p {
          margin: 0;
          font-size: 0.9rem;
          animation: fadeIn 1s ease-out;
        }

        /* Message Styles */
        .message {
          padding: 1rem;
          margin: 1rem 0;
          border-radius: 8px;
          text-align: center;
          animation: fadeIn 0.5s ease-in-out;
          position: relative;
          overflow: hidden;
        }

        .message::before {
          content: "";
          position: absolute;
          top: 0;
          left: 0;
          width: 5px;
          height: 100%;
          animation: heightGrow 0.5s ease-out forwards;
        }

        @keyframes heightGrow {
          from { height: 0; }
          to { height: 100%; }
        }

        .success-message {
          background-color: rgba(16, 185, 129, 0.1);
          color: var(--success-color);
          border: 1px solid rgba(16, 185, 129, 0.2);
        }

        .success-message::before {
          background-color: var(--success-color);
        }

        .error-message {
          background-color: rgba(239, 68, 68, 0.1);
          color: var(--danger-color);
          border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .error-message::before {
          background-color: var(--danger-color);
        }

        /* Form Styles */
        .styled-form div {
            margin-bottom: 20px;
            position: relative;
        }

        .styled-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            transition: var(--transition);
            color: var(--dark-color);
        }

        .styled-form input[type="text"],
        .styled-form input[type="date"],
        .styled-form input[type="number"],
        .styled-form input[type="password"],
        .styled-form input[type="email"],
        .styled-form select,
        .styled-form textarea {
            width: 100%; /* Use 100% width */
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            font-family: "Poppins", sans-serif;
            font-size: 1rem;
        }

        .styled-form input:focus,
        .styled-form select:focus,
        .styled-form textarea:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(30, 58, 138, 0.2);
            outline: none;
        }

        .styled-form button[type="submit"],
        .styled-form button[type="reset"],
        .button-link {
            background: var(--success-color);
            color: white;
            border: 0;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            margin-right: 10px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .styled-form button[type="submit"] i,
        .button-link i {
            margin-right: 8px;
        }

        .styled-form button[type="submit"]::before,
        .styled-form button[type="reset"]::before,
        .button-link::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.5s ease;
            z-index: -1;
        }

        .styled-form button[type="submit"]:hover::before,
        .styled-form button[type="reset"]:hover::before,
        .button-link:hover::before {
            left: 100%;
        }

        .styled-form button[type="reset"] {
            background: var(--warning-color);
        }

        .button-link {
             display: inline-block;
             background: var(--secondary-color);
        }

        .button-link.edit-link {
            background: var(--info-color);
        }

        .button-link.delete-link, .button-danger {
            background: var(--danger-color);
            color: white;
        }

        .styled-form button:hover,
        .button-link:hover {
            opacity: 0.9;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        /* Animation Keyframes */
        @keyframes fadeIn {
          from { opacity: 0; }
          to { opacity: 1; }
        }

        @keyframes fadeInDown {
          from { opacity: 0; transform: translateY(-30px); }
          to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
          from { opacity: 0; transform: translateY(30px); }
          to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
          header h1 {
            font-size: 1.8rem;
          }
          
          header nav ul {
            flex-direction: column;
            align-items: center;
          }
          
          header nav ul li {
            margin: 5px 0;
          }
          
          main {
            width: 95%;
            padding: 1.5rem;
          }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Luxury Hotel Management</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="addReservation"><i class="fas fa-calendar-plus"></i> Add Reservation</a></li>
                    <li><a href="displayReservations"><i class="fas fa-list"></i> View Reservations</a></li>
                    <li><a href="reports"><i class="fas fa-chart-bar"></i> Reports</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Update Reservation</h2>

            <c:if test="${not empty errorMessage}">
                <p class="message error-message"><i class="fas fa-exclamation-circle"></i> <c:out value="${errorMessage}"/></p>
            </c:if>

            <c:if test="${not empty reservation}">
                <form action="updateReservation" method="post" class="styled-form">
                    <!-- IMPORTANT: Use c:out for security, but not inside value attribute for pre-filling -->
                    <input type="hidden" name="reservationID" value="${reservation.reservationID}">
                    <div>
                        <label for="customerName">Customer Name:</label>
                        <input type="text" id="customerName" name="customerName" value="${reservation.customerName}" required>
                    </div>
                    <div>
                        <label for="roomNumber">Room Number:</label>
                        <input type="text" id="roomNumber" name="roomNumber" value="${reservation.roomNumber}" required>
                    </div>
                    <div>
                        <label for="checkInDate">Check-In Date:</label>
                        <fmt:formatDate value="${reservation.checkInDate}" pattern="yyyy-MM-dd" var="fmtCheckInDate" />
                        <input type="date" id="checkInDate" name="checkInDate" value="${fmtCheckInDate}" required>
                    </div>
                    <div>
                        <label for="checkOutDate">Check-Out Date:</label>
                        <fmt:formatDate value="${reservation.checkOutDate}" pattern="yyyy-MM-dd" var="fmtCheckOutDate" />
                        <input type="date" id="checkOutDate" name="checkOutDate" value="${fmtCheckOutDate}" required>
                    </div>
                    <div>
                        <label for="totalAmount">Total Amount:</label>
                        <input type="number" id="totalAmount" name="totalAmount" step="0.01" min="0" value="${reservation.totalAmount}" required>
                    </div>
                    <div>
                        <button type="submit"><i class="fas fa-save"></i> Update Reservation</button>
                        <a href="displayReservations" class="button-link"><i class="fas fa-times"></i> Cancel</a>
                    </div>
                </form>
            </c:if>
            <c:if test="${empty reservation}">
                <p class="message error-message">Reservation details not found. <a href="displayReservations">Go back to list</a>.</p>
            </c:if>

        </main>

        <footer>
            <p>&copy; 2025 Luxury Hotel Management System | Designed for exceptional service</p>
        </footer>
    </div>
</body>
</html>
