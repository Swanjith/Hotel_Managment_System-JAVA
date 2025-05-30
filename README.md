# Advanced Java :Hotel Management System

**Subject Code**: BCS613D<br>
**Name** : Swanjith AK<br>
**USN**: 4AL22CS174<br>
**Sem/Section**: VI/C<br>



This document provides a detailed step-by-step guide to developing the Hotel Management System project using Eclipse IDE, Java, JSP, Servlets, MySQL, and phpMyAdmin.

## Project Structure :

```
HotelWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── reservationadd.jsp
│   ├── reservationupdate.jsp
│   ├── reservationdelete.jsp
│   ├── reservationdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
│   └── css/ (adding a css folder for styles)
│       └── style.css
├── src/
│   └── com/
│       └── hotelapp/ (chosen package name)
│           ├── dao/
│           │   ├── DBConnection.java (Utility for DB connection)
│           │   └── ReservationDAO.java
│           ├── model/
│           │   └── Reservation.java
│           └── servlet/
│               ├── AddReservationServlet.java
│               ├── UpdateReservationServlet.java
│               ├── DeleteReservationServlet.java
│               ├── DisplayReservationsServlet.java
│               └── ReportServlet.java
└── WEB-INF/
    ├── lib/ (Place MySQL JDBC Driver JAR here)
    └── web.xml
```


**1. Prerequisites**


*   **Java Development Kit (JDK):** Version 8 or higher (preferably LTS like JDK 11, 17, or 21). You can get it from Oracle or OpenJDK providers like Adoptium.
*   **Eclipse IDE for Enterprise Java and Web Developers:** Download the latest version from the Eclipse website. This package includes tools for web development.
*   **Apache Tomcat Server:** A servlet container. Version 9 or 10 is recommended. Download it from the Apache Tomcat website. You'll need to configure this server in Eclipse.
*   **MySQL Server:** The database server. Download MySQL Community Server from the official MySQL website.
*   **phpMyAdmin:** A web-based tool for managing MySQL databases. If you install XAMPP, WAMP, or MAMP, phpMyAdmin is usually included. Otherwise, you can download and configure it separately.
*   **MySQL JDBC Driver:** The JAR file that allows Java applications to connect to MySQL. Download the "MySQL Connector/J" from the MySQL website.

**2. DATABASE**
    ```sql
    CREATE TABLE Reservations (
        ReservationID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerName VARCHAR(100) NOT NULL,
        RoomNumber VARCHAR(10) NOT NULL,
        CheckIn DATE NOT NULL,
        CheckOut DATE NOT NULL,
        TotalAmount DECIMAL(10,2) NOT NULL
    );
    ```

**3. Eclipse Project Setup:**

*   **Create a New Dynamic Web Project:**
    1.  Open Eclipse IDE.
    2.  Go to `File > New > Dynamic Web Project`.
    3.  Enter Project Name: `HotelWebApp`.
    4.  **Target Runtime:** Click "New Runtime...". Select your Apache Tomcat version (e.g., Apache Tomcat v9.0). Click "Next". Browse to your Tomcat installation directory. Click "Finish". Ensure your Tomcat runtime is selected.
    5.  **Dynamic web module version:** Use a version like 3.1 or 4.0 (compatible with Tomcat 9+ and modern Java EE specs).
    6.  **Configuration:** You can use the default configuration. Click "Next".
    7.  **Source folders:** Default is `src`. Click "Next".
    8.  **Context root:** `HotelWebApp` (default is fine). **Content directory:** `WebContent` (default is fine). Check "Generate web.xml deployment descriptor".
    9.  Click "Finish".
*   **Add MySQL JDBC Driver:**
    1.  Locate the MySQL Connector/J JAR file you downloaded (e.g., `mysql-connector-java-8.x.x.jar`).
    2.  In Eclipse, expand your `HotelWebApp` project in the Project Explorer.
    3.  Right-click on the `WebContent/WEB-INF/lib` folder.
    4.  Select `Import... > General > File System`. Click "Next".
    5.  Browse to the directory containing the MySQL JDBC JAR file, select the JAR, and click "Finish". Alternatively, you can copy the JAR file and paste it directly into the `WebContent/WEB-INF/lib` folder in Eclipse's Project Explorer.
    6.  The JAR file should now appear in the `lib` folder. Eclipse will automatically add it to the project's build path.

This completes the setup.










