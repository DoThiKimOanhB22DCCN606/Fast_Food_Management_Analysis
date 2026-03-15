### Fast Food Store Management System
**Role:** Technical Business Analyst, Developer

**Core Contributions:**
* **Requirements Elicitation & Process Modeling:** Defined comprehensive use cases and documented both standard and exception scenarios for core operational modules, including Food Management, Order Processing, and Delivery Task.
* **System Architecture & UML Diagramming:** Modeled system behavior and application architecture using Visual Paradigm, delivering detailed Use Case, State, Activity, Sequence, Communication, and Class diagrams to guide technical implementation.
* **Database Design & Integration:** Architected a normalized relational database schema derived from conceptual entity classes and implemented the backend data layer utilizing MySQL.
* **Code Implementation:** Translated business requirements and UML specifications into a fully functional web application utilizing Java, JSP, and the Data Access Object (DAO) design pattern.]

**Project Architecture:**
The application is built on a structured Model-View-Controller (MVC) architecture, utilizing the Data Access Object (DAO) pattern to ensure a strict separation of concerns among business entities, database logic, and the user interface.

* **`src/java/model/`**: Contains core entity classes (e.g., `Food.java`, `Order.java`, `Shipper.java`) that represent business objects and mirror the database schema.
* **`src/java/dao/`**: Houses the Data Access Objects (e.g., `FoodDAO.java`, `OrderDAO.java`). This layer encapsulates all MySQL database interactions, securely abstracting SQL queries from the presentation layer.
* **`web/`**: The frontend presentation directory, utilizing JavaServer Pages (JSP) to render dynamic web interfaces.
* **`web/member/`**: Contains the views and controller logic for user authentication (e.g., `Login.jsp`, `doLogin.jsp`).
* **`web/staff/`**: Houses the primary application views and processing scripts for the staff dashboard, modularized into distinct business workflows (`manageFood/`, `manageOrders/`, and `pickUpOrders/`).
* **`web/WEB-INF/lib/`**: Manages essential project dependencies, specifically the MySQL JDBC driver (`mysql-connector-j-9.5.0.jar`) required for database connectivity.

**Key Features & Functionality:**
* **Authentication & Session Management:** Implemented secure, database-backed login functionality with session tracking to maintain authorized user states across the management dashboard.
* **Food Information Management:** Engineered a dynamic catalog interface enabling staff to execute real-time searches, updates, and pricing modifications directly within the database.
* **Online Order Approval Flow:** Developed a comprehensive order processing pipeline allowing staff to monitor pending orders, execute approvals, and dynamically modify order details (e.g., adding or removing items and combos) based on customer interactions.
* **Logistics & Dispatch Management:** Created a dedicated module for querying available delivery personnel, assigning approved orders, and systematically processing exception scenarios such as courier cancellations.
* **Data Persistence & Integrity:** Ensured seamless integration with the normalized MySQL database, maintaining accurate, real-time records of order statuses, inventory data, and dispatch assignments through the DAO backend.
