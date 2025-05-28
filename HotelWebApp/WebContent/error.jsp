<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
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
            <h2>An Error Occurred</h2>
            
            <p class="message error-message">
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        <c:out value="${errorMessage}"/>
                    </c:when>
                    <c:when test="${not empty requestScope['javax.servlet.error.message']}">
                        Error: <c:out value="${requestScope['javax.servlet.error.message']}"/>
                    </c:when>
                    <c:otherwise>
                        An unexpected error occurred. Please try again later or contact support.
                    </c:otherwise>
                </c:choose>
            </p>

            <c:if test="${pageContext.errorData != null}">
                <div class="error-details">
                    <h4>Error Details:</h4>
                    <p><strong>Request URI:</strong> <c:out value="${pageContext.errorData.requestURI}"/></p>
                    <p><strong>Status Code:</strong> <c:out value="${pageContext.errorData.statusCode}"/></p>
                    <p><strong>Exception:</strong> <c:out value="${pageContext.errorData.throwable}"/></p>
                    
                    <%-- Uncomment for more detailed stack trace during development only
                    <pre>
                        <c:forEach var="trace" items="${pageContext.errorData.throwable.stackTrace}">
                            <c:out value="${trace}"/>\n
                        </c:forEach>
                    </pre>
                    --%>
                </div>
            </c:if>

            <p><a href="index.jsp" class="button-link">Go to Homepage</a></p>

        </main>

        <footer>
            <p>&copy; 2025 Hotel Management System</p>
        </footer>
    </div>
</body>
</html>
