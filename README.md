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

**5. Create Data Access Object (DAO) Classes:**

Create the package `com.hotelapp.dao` by right-clicking on the `src` folder `New > Package`.

*   **Database Connection Utility:** `DBConnection.java`
    *   This class will manage the database connection details.
    *   **File:** `src/com/hotelapp/dao/DBConnection.java`


*   **Reservation DAO:** `ReservationDAO.java`
    *   This class handles all database operations for reservations (CRUD and reports).
    *   **File:** `src/com/hotelapp/dao/ReservationDAO.java`

**6. Create Servlet Classes (Controllers):**

Create the package `com.hotelapp.servlet` by right-clicking on the `src` folder `New > Package`.
Servlets will handle incoming HTTP requests, interact with the DAO, and forward to JSP pages.

*   **`AddReservationServlet.java`**
    *   Handles adding new reservations.
    *   **File:** `src/com/hotelapp/servlet/AddReservationServlet.java`
  
*   **`UpdateReservationServlet.java`**
    *   Handles updating existing reservations.
    *   **File:** `src/com/hotelapp/servlet/UpdateReservationServlet.java`
   
*   **`DeleteReservationServlet.java`**
    *   Handles deleting reservations.
    *   **File:** `src/com/hotelapp/servlet/DeleteReservationServlet.java`
   
*   **`DisplayReservationsServlet.java`**
    *   Handles displaying all reservations.
    *   **File:** `src/com/hotelapp/servlet/DisplayReservationsServlet.java`
  
*   **`ReportServlet.java`**
    *   Handles generating various reports.
    *   **File:** `src/com/hotelapp/servlet/ReportServlet.java`
    
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

**7. Create JSP Pages (Views):**

Create the following JSP files directly under the `WebContent` folder.

*   **`index.jsp`** (Main entry point)
    *   **File:** `WebContent/index.jsp`
   
*   **`reservationadd.jsp`** (Form for adding reservations)
    *   **File:** `WebContent/reservationadd.jsp`
    
*   **`reservationupdate.jsp`** (Form for editing reservations)
    *   **File:** `WebContent/reservationupdate.jsp`
   
*   **`reservationdisplay.jsp`** (Displays reservation listings)
    *   **File:** `WebContent/reservationdisplay.jsp`
   
*   **`reports.jsp`** (Interface for selecting reports)
    *   **File:** `WebContent/reports.jsp`
    
*   **`report_result.jsp`** (Displays generated reports)
    *   **File:** `WebContent/report_result.jsp`
    
*   **`confirmDelete.jsp`** (Confirmation page for delete operation)
    *   **File:** `WebContent/confirmDelete.jsp`
   
*   **`error.jsp`** (Generic error page)
    *   **File:** `WebContent/error.jsp`
   

## Phase 4: Configuration, Testing, and Deployment

**8. Configure `web.xml` (Deployment Descriptor):**

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



