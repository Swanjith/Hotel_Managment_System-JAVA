<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Hotel Management System</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Embedded CSS - No external file needed -->
    <style>
        /* Import Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;700&display=swap');

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

        body {
          font-family: 'Poppins', sans-serif;
          line-height: 1.6;
          color: var(--dark-color);
          background-color: #f9fafb;
          background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          background-attachment: fixed;
        }

        .container {
          width: 90%;
          max-width: 1200px;
          margin: 0 auto;
          padding: 0;
        }

        /* Enhanced Header Styles */
        header {
          background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
          color: white;
          padding: 1.5rem 0;
          box-shadow: var(--box-shadow);
          position: relative;
          z-index: 10;
        }

        header::before {
          content: '';
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
          font-family: 'Playfair Display', serif;
          text-align: center;
          margin: 0;
          font-size: 2.5rem;
          font-weight: 700;
          text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
          letter-spacing: 1px;
          padding-bottom: 0.5rem;
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
          content: '';
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
          margin: 2rem 0;
          padding: 2rem;
          box-shadow: var(--box-shadow);
          position: relative;
          overflow: hidden;
        }

        main::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 5px;
          background: linear-gradient(to right, var(--primary-color), var(--secondary-color), var(--accent-color));
        }

        main h2 {
          font-family: 'Playfair Display', serif;
          color: var(--primary-color);
          text-align: center;
          margin-bottom: 1.5rem;
          font-size: 2rem;
          position: relative;
          padding-bottom: 10px;
        }

        main h2::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 50%;
          transform: translateX(-50%);
          width: 80px;
          height: 3px;
          background: var(--accent-color);
        }

        /* Enhanced Footer */
        footer {
          text-align: center;
          padding: 1.5rem 0;
          background: var(--dark-color);
          color: white;
          margin-top: 2rem;
          border-radius: 10px 10px 0 0;
          position: relative;
        }

        footer p {
          margin: 0;
          font-size: 0.9rem;
        }

        /* Home Page Specific Styles */
        .welcome-section {
          text-align: center;
          padding: 2rem 0;
        }

        .welcome-message {
          font-size: 1.2rem;
          color: var(--dark-color);
          max-width: 800px;
          margin: 0 auto 2rem;
          line-height: 1.8;
        }

        .features-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
          margin: 3rem 0;
        }

        .feature-card {
          background: white;
          border-radius: 8px;
          padding: 1.5rem;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
          transition: var(--transition);
          text-align: center;
          border: 1px solid #eee;
          position: relative;
          overflow: hidden;
        }

        .feature-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .feature-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 4px;
          background: var(--secondary-color);
        }

        .feature-card:nth-child(2)::before {
          background: var(--accent-color);
        }

        .feature-card:nth-child(3)::before {
          background: var(--success-color);
        }

        .feature-card:nth-child(4)::before {
          background: var(--info-color);
        }

        .feature-icon {
          font-size: 2.5rem;
          margin-bottom: 1rem;
          color: var(--primary-color);
        }

        .feature-card h3 {
          margin-bottom: 0.5rem;
          color: var(--dark-color);
        }

        .feature-card p {
          color: #666;
          font-size: 0.9rem;
        }

        .cta-buttons {
          display: flex;
          justify-content: center;
          gap: 1rem;
          margin-top: 2rem;
          flex-wrap: wrap;
        }

        .btn {
          display: inline-block;
          padding: 0.8rem 1.5rem;
          border-radius: 50px;
          text-decoration: none;
          font-weight: 500;
          text-transform: uppercase;
          letter-spacing: 1px;
          font-size: 0.9rem;
          transition: var(--transition);
          cursor: pointer;
          border: none;
          outline: none;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
          background: var(--primary-color);
          color: white;
        }

        .btn-primary:hover {
          background: #152a66;
          transform: translateY(-2px);
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        .btn-secondary {
          background: var(--accent-color);
          color: white;
        }

        .btn-secondary:hover {
          background: #e08e0b;
          transform: translateY(-2px);
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        /* Hotel Image Showcase */
        .hotel-showcase {
          margin: 3rem 0;
          position: relative;
          height: 300px;
          border-radius: 10px;
          overflow: hidden;
          box-shadow: var(--box-shadow);
        }

        .showcase-slide {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          opacity: 0;
          transition: opacity 1s ease-in-out;
          background-size: cover;
          background-position: center;
        }

        .showcase-slide.active {
          opacity: 1;
        }

        .showcase-slide:nth-child(1) {
          background-image: url('https://source.unsplash.com/random/1200x600/?hotel-lobby');
        }

        .showcase-slide:nth-child(2) {
          background-image: url('https://source.unsplash.com/random/1200x600/?hotel-room');
        }

        .showcase-slide:nth-child(3) {
          background-image: url('https://source.unsplash.com/random/1200x600/?hotel-pool');
        }

        .showcase-caption {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          background: rgba(0, 0, 0, 0.6);
          color: white;
          padding: 1rem;
          text-align: center;
        }

        /* Stats Section */
        .stats-section {
          display: flex;
          justify-content: space-around;
          flex-wrap: wrap;
          margin: 3rem 0;
          text-align: center;
        }

        .stat-item {
          padding: 1rem;
          flex: 1;
          min-width: 150px;
        }

        .stat-number {
          font-size: 2.5rem;
          font-weight: 700;
          color: var(--primary-color);
          margin-bottom: 0.5rem;
          display: block;
        }

        .stat-label {
          font-size: 0.9rem;
          color: #666;
          text-transform: uppercase;
          letter-spacing: 1px;
        }

        /* Testimonials */
        .testimonials {
          margin: 3rem 0;
          position: relative;
        }

        .testimonial-container {
          overflow: hidden;
          position: relative;
          padding: 2rem 0;
        }

        .testimonial-slide {
          text-align: center;
          padding: 1.5rem;
          background: #f8f9fa;
          border-radius: 8px;
          margin: 0 auto;
          max-width: 800px;
          opacity: 0;
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          transition: opacity 0.5s ease-in-out;
        }

        .testimonial-slide.active {
          opacity: 1;
          position: relative;
        }

        .testimonial-text {
          font-style: italic;
          margin-bottom: 1rem;
          position: relative;
          padding: 0 2rem;
        }

        .testimonial-text::before,
        .testimonial-text::after {
          content: '"';
          font-size: 3rem;
          color: var(--accent-color);
          opacity: 0.3;
          position: absolute;
        }

        .testimonial-text::before {
          top: -20px;
          left: 0;
        }

        .testimonial-text::after {
          bottom: -40px;
          right: 0;
        }

        .testimonial-author {
          font-weight: 600;
          color: var(--primary-color);
        }

        .testimonial-role {
          font-size: 0.8rem;
          color: #666;
        }

        .testimonial-dots {
          display: flex;
          justify-content: center;
          margin-top: 1rem;
        }

        .dot {
          width: 10px;
          height: 10px;
          background: #ccc;
          border-radius: 50%;
          margin: 0 5px;
          cursor: pointer;
          transition: var(--transition);
        }

        .dot.active {
          background: var(--primary-color);
        }

        /* Message Styles */
        .message {
          padding: 1rem;
          margin: 1rem 0;
          border-radius: 8px;
          text-align: center;
          animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
          from { opacity: 0; transform: translateY(-10px); }
          to { opacity: 1; transform: translateY(0); }
        }

        .success-message {
          background-color: rgba(16, 185, 129, 0.1);
          color: var(--success-color);
          border: 1px solid rgba(16, 185, 129, 0.2);
        }

        .error-message {
          background-color: rgba(239, 68, 68, 0.1);
          color: var(--danger-color);
          border: 1px solid rgba(239, 68, 68, 0.2);
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
          
          .features-grid {
            grid-template-columns: 1fr;
          }
          
          .hotel-showcase {
            height: 200px;
          }
          
          .cta-buttons {
            flex-direction: column;
            align-items: center;
          }
          
          .btn {
            width: 100%;
            max-width: 300px;
            margin-bottom: 0.5rem;
            text-align: center;
          }
        }

        /* Animation Keyframes */
        @keyframes fadeIn {
          from { opacity: 0; }
          to { opacity: 1; }
        }

        @keyframes slideInFromLeft {
          from { transform: translateX(-50px); opacity: 0; }
          to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideInFromRight {
          from { transform: translateX(50px); opacity: 0; }
          to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideInFromBottom {
          from { transform: translateY(50px); opacity: 0; }
          to { transform: translateY(0); opacity: 1; }
        }

        /* Apply animations to elements */
        .welcome-section {
          animation: fadeIn 1s ease-out;
        }

        .feature-card:nth-child(1) {
          animation: slideInFromLeft 0.5s ease-out 0.2s both;
        }

        .feature-card:nth-child(2) {
          animation: slideInFromLeft 0.5s ease-out 0.4s both;
        }

        .feature-card:nth-child(3) {
          animation: slideInFromRight 0.5s ease-out 0.6s both;
        }

        .feature-card:nth-child(4) {
          animation: slideInFromRight 0.5s ease-out 0.8s both;
        }

        .hotel-showcase {
          animation: fadeIn 1s ease-out 0.5s both;
        }

        .stats-section {
          animation: slideInFromBottom 0.5s ease-out 0.7s both;
        }

        .testimonials {
          animation: fadeIn 1s ease-out 0.9s both;
        }

        /* Form Styles */
        .styled-form div {
            margin-bottom: 15px;
        }

        .styled-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .styled-form input[type="text"],
        .styled-form input[type="date"],
        .styled-form input[type="number"],
        .styled-form input[type="password"],
        .styled-form input[type="email"],
        .styled-form select,
        .styled-form textarea {
            width: calc(100% - 22px); /* Account for padding and border */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box; /* Important for width calculation */
        }

        .styled-form button[type="submit"],
        .styled-form button[type="reset"],
        .button-link {
            background: var(--success-color);
            color: white;
            border: 0;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
            transition: var(--transition);
        }

        .styled-form button[type="reset"] {
            background: var(--warning-color);
        }

        .button-link {
             display: inline-block; /* To allow padding and margin */
        }

        .button-link.edit-link {
            background: var(--info-color);
        }

        .button-link.delete-link, .button-danger {
            background: var(--danger-color);
            color: white; /* Ensure text is visible */
        }

        .styled-form button:hover,
        .button-link:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        /* Table Styles */
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--box-shadow);
        }

        .styled-table thead tr {
            background-color: var(--primary-color);
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
            transition: var(--transition);
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f4f6;
        }

        .styled-table tbody tr:hover {
            background-color: #f0f4ff;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid var(--secondary-color);
        }

        .styled-table tbody tr.active-row {
            font-weight: bold;
            color: var(--primary-color);
        }

        .action-link {
            margin-right: 8px;
            padding: 5px 10px;
            text-decoration: none;
            color: white;
            border-radius: 3px;
            font-size: 0.9em;
            transition: var(--transition);
        }

        .action-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* Report Specific Styles */
        .report-form {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 8px;
            background-color: #f9fafb;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: var(--transition);
        }

        .report-form:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .report-form h3 {
            margin-top: 0;
            color: var(--primary-color);
            font-size: 1.2rem;
            border-bottom: 2px solid var(--accent-color);
            padding-bottom: 8px;
            margin-bottom: 15px;
        }

        .form-divider {
            margin: 30px 0;
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0));
        }

        .report-summary {
            font-size: 1.1em;
            padding: 15px;
            background-color: #f0f4ff;
            border-left: 5px solid var(--secondary-color);
            border-radius: 4px;
            margin: 20px 0;
        }

        .confirmation-table {
            margin-bottom: 20px;
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .confirmation-table th {
            text-align: right;
            padding: 12px 15px;
            background-color: #f9fafb;
            width: 40%;
            font-weight: 600;
            color: var(--dark-color);
        }

        .confirmation-table td {
            text-align: left;
            padding: 12px 15px;
        }

        .confirmation-table tr {
            border-bottom: 1px solid #eee;
        }

        /* Error Page Specifics */
        .error-details {
            background-color: #fff3cd;
            border: 1px solid #ffeeba;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .error-details h4 {
            margin-top: 0;
            color: #856404;
            font-size: 1.2rem;
            margin-bottom: 15px;
        }

        .error-details pre {
            white-space: pre-wrap;
            background: #f8f9fa;
            padding: 15px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            max-height: 300px;
            overflow-y: auto;
            font-family: monospace;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Luxury Hotel Management</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="addReservation"><i class="fas fa-calendar-plus"></i> Add Reservation</a></li>
                    <li><a href="displayReservations"><i class="fas fa-list"></i> View Reservations</a></li>
                    <li><a href="reports"><i class="fas fa-chart-bar"></i> Reports</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <section class="welcome-section">
                <h2>Welcome to Luxury Hotel Management System</h2>
                <p class="welcome-message">
                    Experience the ultimate in hotel management efficiency. Our comprehensive system allows you to manage reservations, 
                    track room availability, generate reports, and provide exceptional service to your guests.
                </p>
                
                <c:if test="${not empty successMessage}">
                    <p class="message success-message"><c:out value="${successMessage}"/></p>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <p class="message error-message"><c:out value="${errorMessage}"/></p>
                </c:if>
                
                <div class="cta-buttons">
                    <a href="addReservation" class="btn btn-primary"><i class="fas fa-calendar-plus"></i> New Reservation</a>
                    <a href="displayReservations" class="btn btn-secondary"><i class="fas fa-list"></i> View All Reservations</a>
                </div>
            </section>
            
            <!-- Hotel Image Showcase with Automatic Slideshow -->
            <div class="hotel-showcase">
                <div class="showcase-slide active"></div>
                <div class="showcase-slide"></div>
                <div class="showcase-slide"></div>
                <div class="showcase-caption">Experience luxury at its finest</div>
            </div>
            
            <!-- Features Section -->
            <section class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-calendar-check"></i></div>
                    <h3>Reservation Management</h3>
                    <p>Easily create, update, and cancel reservations with our intuitive interface.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-bed"></i></div>
                    <h3>Room Availability</h3>
                    <p>Real-time tracking of room availability to maximize occupancy rates.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
                    <h3>Comprehensive Reports</h3>
                    <p>Generate detailed reports on occupancy, revenue, and guest statistics.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-concierge-bell"></i></div>
                    <h3>Guest Services</h3>
                    <p>Track guest preferences and special requests to enhance their experience.</p>
                </div>
            </section>
            
            <!-- Stats Section -->
            <section class="stats-section">
                <div class="stat-item">
                    <span class="stat-number" id="roomCount">120</span>
                    <span class="stat-label">Luxury Rooms</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number" id="guestCount">1500+</span>
                    <span class="stat-label">Happy Guests</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number" id="staffCount">50</span>
                    <span class="stat-label">Staff Members</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number" id="ratingCount">4.9</span>
                    <span class="stat-label">Average Rating</span>
                </div>
            </section>
            
            <!-- Testimonials Section -->
            <section class="testimonials">
                <h2>What Our Clients Say</h2>
                <div class="testimonial-container">
                    <div class="testimonial-slide active">
                        <p class="testimonial-text">This hotel management system has revolutionized our operations. We've seen a 30% increase in efficiency since implementation.</p>
                        <p class="testimonial-author">John Doe</p>
                        <p class="testimonial-role">Hotel Manager, Grand Plaza</p>
                    </div>
                    <div class="testimonial-slide">
                        <p class="testimonial-text">The reporting features are exceptional. I can now make data-driven decisions that have improved our revenue by 25%.</p>
                        <p class="testimonial-author">Jane Smith</p>
                        <p class="testimonial-role">Director of Operations, Seaside Resort</p>
                    </div>
                    <div class="testimonial-slide">
                        <p class="testimonial-text">The intuitive interface made training our staff a breeze. Everyone adapted to the system within days.</p>
                        <p class="testimonial-author">Robert Johnson</p>
                        <p class="testimonial-role">HR Director, Mountain View Hotel</p>
                    </div>
                </div>
                <div class="testimonial-dots">
                    <span class="dot active" onclick="currentTestimonial(0)"></span>
                    <span class="dot" onclick="currentTestimonial(1)"></span>
                    <span class="dot" onclick="currentTestimonial(2)"></span>
                </div>
            </section>
        </main>

        <footer>
            <p>&copy; 2025 Luxury Hotel Management System | Designed for exceptional service</p>
        </footer>
    </div>
    
    <!-- JavaScript for interactive elements -->
    <script>
        // Slideshow functionality for hotel showcase
        let currentSlide = 0;
        const slides = document.querySelectorAll('.showcase-slide');
        
        function showSlide(n) {
            // Hide all slides
            for (let i = 0; i < slides.length; i++) {
                slides[i].classList.remove('active');
            }
            // Show the selected slide
            slides[n].classList.add('active');
        }
        
        function nextSlide() {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }
        
        // Auto-advance slides every 5 seconds
        setInterval(nextSlide, 5000);
        
        // Testimonial slider functionality
        let currentTestimonialIndex = 0;
        const testimonials = document.querySelectorAll('.testimonial-slide');
        const dots = document.querySelectorAll('.dot');
        
        function currentTestimonial(n) {
            showTestimonial(currentTestimonialIndex = n);
        }
        
        function showTestimonial(n) {
            // Hide all testimonials
            for (let i = 0; i < testimonials.length; i++) {
                testimonials[i].classList.remove('active');
                dots[i].classList.remove('active');
            }
            // Show the selected testimonial
            testimonials[n].classList.add('active');
            dots[n].classList.add('active');
        }
        
        function nextTestimonial() {
            currentTestimonialIndex = (currentTestimonialIndex + 1) % testimonials.length;
            showTestimonial(currentTestimonialIndex);
        }
        
        // Auto-advance testimonials every 8 seconds
        setInterval(nextTestimonial, 8000);
        
        // Animate stats counting up
        function animateStats() {
            const stats = document.querySelectorAll('.stat-number');
            const targetValues = [120, 1500, 50, 4.9]; // Target values for each stat
            const duration = 2000; // Animation duration in milliseconds
            const frameDuration = 1000 / 60; // 60fps
            const totalFrames = Math.round(duration / frameDuration);
            
            stats.forEach((stat, index) => {
                let frame = 0;
                const target = targetValues[index];
                const initialValue = 0;
                const increment = (target - initialValue) / totalFrames;
                
                const counter = setInterval(() => {
                    frame++;
                    const value = initialValue + (increment * frame);
                    
                    if (index === 3) { // For the rating which is a decimal
                        stat.textContent = value.toFixed(1);
                    } else {
                        stat.textContent = Math.floor(value);
                        if (index === 1 && frame === totalFrames) stat.textContent += '+'; // Add + back to 1500+
                    }
                    
                    if (frame === totalFrames) {
                        clearInterval(counter);
                    }
                }, frameDuration);
            });
        }
        
        // Run animations when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Start with first slide
            showSlide(0);
            
            // Start with first testimonial
            showTestimonial(0);
            
            // Animate stats
            animateStats();
            
            // Add smooth scrolling for navigation
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        });
    </script>
</body>
</html>