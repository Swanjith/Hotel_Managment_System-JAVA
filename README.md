# Hotel Management System: Detailed Step-by-Step Guide

This document provides a detailed step-by-step guide to developing the Hotel Management System project using Eclipse IDE, Java, JSP, Servlets, MySQL, and phpMyAdmin, based on the requirements from your PDF and our previous discussion.

## Important Notes from Assignment PDF:

*   All projects should include input validation.
*   Styling for better look and feel is required.
*   Comprehensive demonstration with queries of modules during the demo session.
*   Code implementation should follow best practices: prepared statements, exception handling, and MVC architecture principles.
*   Use a Dynamic Web Project with HTML and JSP along with JDBC connectivity with MySQL as backend.

## Project Structure (as per PDF):

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

Let's begin with the setup.



## Phase 1: Software Installation and Setup

This phase covers setting up your development environment.

**1. Software Installation (Prerequisites):**

Ensure you have the following software installed. If not, download and install them from their official websites:

*   **Java Development Kit (JDK):** Version 8 or higher (preferably LTS like JDK 11, 17, or 21). You can get it from Oracle or OpenJDK providers like Adoptium.
*   **Eclipse IDE for Enterprise Java and Web Developers:** Download the latest version from the Eclipse website. This package includes tools for web development.
*   **Apache Tomcat Server:** A servlet container. Version 9 or 10 is recommended. Download it from the Apache Tomcat website. You'll need to configure this server in Eclipse.
*   **MySQL Server:** The database server. Download MySQL Community Server from the official MySQL website.
*   **phpMyAdmin:** A web-based tool for managing MySQL databases. If you install XAMPP, WAMP, or MAMP, phpMyAdmin is usually included. Otherwise, you can download and configure it separately.
*   **MySQL JDBC Driver:** The JAR file that allows Java applications to connect to MySQL. Download the "MySQL Connector/J" from the MySQL website.

**2. Database Setup using phpMyAdmin:**

*   Open phpMyAdmin in your web browser (usually `http://localhost/phpmyadmin`).
*   **Create a new database:**
    *   Click on "New" in the left sidebar or the "Databases" tab.
    *   Enter the database name: `hotel_db`.
    *   Choose a collation (e.g., `utf8mb4_general_ci`) and click "Create".
*   **Create the `Reservations` table:**
    *   Select the `hotel_db` database from the left sidebar.
    *   Go to the "SQL" tab.
    *   Paste the following SQL code and click "Go":

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
    *   **Note:** I've made `ReservationID` `AUTO_INCREMENT` for easier primary key management and added `NOT NULL` constraints to essential fields as per best practices. This ensures data integrity.

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

This completes the initial setup. Next, we will develop the backend components.




## Phase 2: Backend Development (Java - MVC Pattern)

This phase focuses on creating the Java classes that will handle the business logic and data access, following the Model-View-Controller (MVC) pattern.

**4. Create Model Class (Java Bean):**

Create the package `com.hotelapp.model` by right-clicking on the `src` folder `New > Package`.
Then, create the `Reservation.java` class inside this package.

*   **File:** `src/com/hotelapp/model/Reservation.java`

```java
// Code for Reservation.java (already provided and saved as /home/ubuntu/Reservation.java)
// Ensure this file is placed in src/com/hotelapp/model/Reservation.java in your Eclipse project.
```
*(The content of `Reservation.java` was previously generated and saved to `/home/ubuntu/Reservation.java`. You will need to create this file in your Eclipse project at the specified path and paste the content.)*

**5. Create Data Access Object (DAO) Classes:**

Create the package `com.hotelapp.dao` by right-clicking on the `src` folder `New > Package`.

*   **Database Connection Utility:** `DBConnection.java`
    *   This class will manage the database connection details.
    *   **File:** `src/com/hotelapp/dao/DBConnection.java`

    ```java
    // Code for DBConnection.java (already provided and saved as /home/ubuntu/DBConnection.java)
    // IMPORTANT: Remember to replace "your_mysql_username" and "your_mysql_password" 
    // in DBConnection.java with your actual MySQL credentials.
    // Ensure this file is placed in src/com/hotelapp/dao/DBConnection.java in your Eclipse project.
    ```
    *(The content of `DBConnection.java` was previously generated and saved to `/home/ubuntu/DBConnection.java`. Create this file in your Eclipse project at the specified path and paste the content. **Crucially, update the placeholder username and password with your MySQL credentials.**)*

*   **Reservation DAO:** `ReservationDAO.java`
    *   This class handles all database operations for reservations (CRUD and reports).
    *   **File:** `src/com/hotelapp/dao/ReservationDAO.java`

    ```java
    // Code for ReservationDAO.java (already provided and saved as /home/ubuntu/ReservationDAO.java)
    // Ensure this file is placed in src/com/hotelapp/dao/ReservationDAO.java in your Eclipse project.
    ```
    *(The content of `ReservationDAO.java` was previously generated and saved to `/home/ubuntu/ReservationDAO.java`. Create this file in your Eclipse project at the specified path and paste the content.)*

**6. Create Servlet Classes (Controllers):**

Create the package `com.hotelapp.servlet` by right-clicking on the `src` folder `New > Package`.
Servlets will handle incoming HTTP requests, interact with the DAO, and forward to JSP pages.

*   **`AddReservationServlet.java`**
    *   Handles adding new reservations.
    *   **File:** `src/com/hotelapp/servlet/AddReservationServlet.java`
    ```java
    // Code for AddReservationServlet.java (already provided and saved as /home/ubuntu/AddReservationServlet.java)
    // Ensure this file is placed in src/com/hotelapp/servlet/AddReservationServlet.java
    ```
*   **`UpdateReservationServlet.java`**
    *   Handles updating existing reservations.
    *   **File:** `src/com/hotelapp/servlet/UpdateReservationServlet.java`
    ```java
    // Code for UpdateReservationServlet.java (already provided and saved as /home/ubuntu/UpdateReservationServlet.java)
    // Ensure this file is placed in src/com/hotelapp/servlet/UpdateReservationServlet.java
    ```
*   **`DeleteReservationServlet.java`**
    *   Handles deleting reservations.
    *   **File:** `src/com/hotelapp/servlet/DeleteReservationServlet.java`
    ```java
    // Code for DeleteReservationServlet.java (already provided and saved as /home/ubuntu/DeleteReservationServlet.java)
    // Ensure this file is placed in src/com/hotelapp/servlet/DeleteReservationServlet.java
    ```
*   **`DisplayReservationsServlet.java`**
    *   Handles displaying all reservations.
    *   **File:** `src/com/hotelapp/servlet/DisplayReservationsServlet.java`
    ```java
    // Code for DisplayReservationsServlet.java (already provided and saved as /home/ubuntu/DisplayReservationsServlet.java)
    // Ensure this file is placed in src/com/hotelapp/servlet/DisplayReservationsServlet.java
    ```
*   **`ReportServlet.java`**
    *   Handles generating various reports.
    *   **File:** `src/com/hotelapp/servlet/ReportServlet.java`
    ```java
    // Code for ReportServlet.java (already provided and saved as /home/ubuntu/ReportServlet.java)
    // Ensure this file is placed in src/com/hotelapp/servlet/ReportServlet.java
    ```

*(The content for each servlet was previously generated and saved to its respective `.java` file in `/home/ubuntu/`. You will need to create these files in your Eclipse project under the `src/com/hotelapp/servlet/` package and paste the corresponding content.)*




## Phase 3: Frontend Development (JSP and HTML)

This phase involves creating the JSP pages that will serve as the views for your application. These pages will use HTML for structure, CSS for styling, and JSP tags (including JSTL) for dynamic content.

**Create CSS Folder and File:**

1.  In Eclipse, right-click on the `WebContent` folder.
2.  Select `New > Folder`.
3.  Name the folder `css`.
4.  Right-click on the new `css` folder.
5.  Select `New > File`.
6.  Name the file `style.css`.

*   **File:** `WebContent/css/style.css`

    ```css
    /* Code for style.css (already provided and saved as /home/ubuntu/style.css) */
    /* Ensure this file is placed in WebContent/css/style.css in your Eclipse project. */
    ```
    *(The content of `style.css` was previously generated and saved to `/home/ubuntu/style.css`. Create this file in your Eclipse project at the specified path and paste the content.)*

**7. Create JSP Pages (Views):**

Create the following JSP files directly under the `WebContent` folder.

*   **`index.jsp`** (Main entry point)
    *   **File:** `WebContent/index.jsp`
    ```jsp
    <%-- Code for index.jsp (already provided and saved as /home/ubuntu/index.jsp) --%>
    <%-- Ensure this file is placed in WebContent/index.jsp in your Eclipse project. --%>
    ```
*   **`reservationadd.jsp`** (Form for adding reservations)
    *   **File:** `WebContent/reservationadd.jsp`
    ```jsp
    <%-- Code for reservationadd.jsp (already provided and saved as /home/ubuntu/reservationadd.jsp) --%>
    <%-- Ensure this file is placed in WebContent/reservationadd.jsp in your Eclipse project. --%>
    ```
*   **`reservationupdate.jsp`** (Form for editing reservations)
    *   **File:** `WebContent/reservationupdate.jsp`
    ```jsp
    <%-- Code for reservationupdate.jsp (already provided and saved as /home/ubuntu/reservationupdate.jsp) --%>
    <%-- Ensure this file is placed in WebContent/reservationupdate.jsp in your Eclipse project. --%>
    ```
*   **`reservationdisplay.jsp`** (Displays reservation listings)
    *   **File:** `WebContent/reservationdisplay.jsp`
    ```jsp
    <%-- Code for reservationdisplay.jsp (already provided and saved as /home/ubuntu/reservationdisplay.jsp) --%>
    <%-- Ensure this file is placed in WebContent/reservationdisplay.jsp in your Eclipse project. --%>
    ```
*   **`reports.jsp`** (Interface for selecting reports)
    *   **File:** `WebContent/reports.jsp`
    ```jsp
    <%-- Code for reports.jsp (already provided and saved as /home/ubuntu/reports.jsp) --%>
    <%-- Ensure this file is placed in WebContent/reports.jsp in your Eclipse project. --%>
    ```
*   **`report_result.jsp`** (Displays generated reports)
    *   **File:** `WebContent/report_result.jsp`
    ```jsp
    <%-- Code for report_result.jsp (already provided and saved as /home/ubuntu/report_result.jsp) --%>
    <%-- Ensure this file is placed in WebContent/report_result.jsp in your Eclipse project. --%>
    ```
*   **`confirmDelete.jsp`** (Confirmation page for delete operation)
    *   **File:** `WebContent/confirmDelete.jsp`
    ```jsp
    <%-- Code for confirmDelete.jsp (already provided and saved as /home/ubuntu/confirmDelete.jsp) --%>
    <%-- Ensure this file is placed in WebContent/confirmDelete.jsp in your Eclipse project. --%>
    ```
*   **`error.jsp`** (Generic error page)
    *   **File:** `WebContent/error.jsp`
    ```jsp
    <%-- Code for error.jsp (already provided and saved as /home/ubuntu/error.jsp) --%>
    <%-- Ensure this file is placed in WebContent/error.jsp in your Eclipse project. --%>
    ```

*(The content for each JSP was previously generated and saved to its respective `.jsp` file in `/home/ubuntu/`. You will need to create these files in your Eclipse project under the `WebContent/` folder (and `WebContent/css/` for `style.css`) and paste the corresponding content.)*

**Important JSTL Note:**
For JSTL tags (`<c:out>`, `<c:forEach>`, etc.) to work, you need the JSTL library. If it's not already included with your Tomcat server or Eclipse setup, you'll need to add `jstl-1.2.jar` (or a compatible version) to your `WebContent/WEB-INF/lib` folder. You can download it from the Apache Taglibs project or Maven Central.

## Phase 4: Configuration, Testing, and Deployment

**8. Configure `web.xml` (Deployment Descriptor):**

This file is located in `WebContent/WEB-INF/web.xml`. If you selected "Generate web.xml deployment descriptor" during project creation, it will exist. Otherwise, create it.

*   **File:** `WebContent/WEB-INF/web.xml`

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xmlns="http://xmlns.jcp.org/xml/ns/javaee"
             xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
             id="WebApp_ID" version="4.0">

      <display-name>HotelWebApp</display-name>

      <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
      </welcome-file-list>

      <!-- 
        Servlet mappings are handled by @WebServlet annotations in the servlet classes.
        If you were not using annotations, you would define them here.
      -->

      <!-- Error Page Configuration -->
      <error-page>
        <exception-type>java.lang.Throwable</exception-type>
        <location>/error.jsp</location>
      </error-page>
      <error-page>
        <error-code>404</error-code>
        <location>/error.jsp</location> 
      </error-page>
      <error-page>
        <error-code>500</error-code>
        <location>/error.jsp</location>
      </error-page>

    </web-app>
    ```
    *(The content for `web.xml` was previously generated and saved to `/home/ubuntu/web.xml`. Ensure your `WebContent/WEB-INF/web.xml` file matches this content.)*

**9. Testing and Demonstration:**

*   **Run the Project:**
    1.  In Eclipse, right-click on the `HotelWebApp` project.
    2.  Select `Run As > Run on Server`.
    3.  Choose your configured Tomcat server and click "Finish".
    4.  Eclipse will start the server and open the application in a web browser (usually at `http://localhost:8080/HotelWebApp/`).
*   **Test All Functionalities:**
    *   **CRUD Operations:**
        *   Add new reservations via `reservationadd.jsp`.
        *   View all reservations on `reservationdisplay.jsp`.
        *   Update existing reservations.
        *   Delete reservations (test the confirmation step).
    *   **Input Validation:**
        *   Try submitting forms with empty fields.
        *   Enter invalid data types (e.g., text in date fields, negative amounts).
        *   Ensure check-out date is not before check-in date.
    *   **Reports:**
        *   Generate reports for reservations by date range.
        *   Generate reports for most frequently booked rooms.
        *   Generate reports for total revenue over a period.
        *   Test with various date ranges and data to ensure accuracy.
    *   **Navigation and Links:** Ensure all navigation links work correctly.
    *   **Error Handling:** Test scenarios that might cause errors (e.g., try to access a non-existent reservation ID for update/delete) and verify that the `error.jsp` page is displayed gracefully.
*   **Demonstration Preparation:** As per the PDF, prepare to demonstrate all modules and explain the code, especially the MVC architecture, prepared statements, and exception handling.

**10. Final Review and Best Practices:**

*   **MVC Adherence:** Confirm that your servlets (Controllers) handle requests, DAOs (part of Model) manage data access, Java Beans (Model) represent data, and JSPs (Views) handle presentation.
*   **Prepared Statements:** Double-check that all SQL queries in `ReservationDAO.java` use `PreparedStatement` to prevent SQL injection.
*   **Exception Handling:** Ensure `try-catch` blocks are used appropriately in DAOs and Servlets to handle `SQLException`, `ParseException`, etc. Errors should be logged (e.g., `e.printStackTrace()` for development, consider a logging framework for production) and user-friendly messages or error pages shown.
*   **Code Clarity:** Add comments to your Java code and JSPs where necessary to explain complex logic.
*   **Styling:** Ensure the application has a good look and feel as required. You can expand `style.css` further.
*   **Project Structure:** Verify your project structure matches the one outlined and expected.

This detailed guide should help you complete your Hotel Management System project. Remember to replace placeholders (like MySQL credentials in `DBConnection.java`) with your actual information.

Good luck with your assignment!
