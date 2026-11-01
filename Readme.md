# 🏫 Java Web-Based Student Management System

A robust, enterprise-standard **Student Management System** developed as a Java web application. This portal is built using **Java Servlets, JSP (JavaServer Pages), JDBC (Java Database Connectivity), and MySQL Database**. It incorporates strict administrative access control, stateful session tracking, and full transactional **CRUD (Create, Read, Update, Delete)** operations to streamline student record administration. The entire lifecycle and build configurations are managed using **Apache Maven**.

---

## 🎓 Project Details
- **Project Name:** Centralized Student Information & Enrollment Management System
- **Student Developer:** Yashik Jindal
- **Role & Configuration:** Full-Stack Web Engineering & Relational Schema Design
- **Architecture Paradigm:** Java Enterprise Edition (JEE) 3-Tier Web Architecture
- **Build Management:** Apache Maven

---

## 🎯 Project Objectives
- **Centralize Academic Logs:** Transition manual student tracking registers into a unified, high-integrity relational SQL database.
- **Enforce State Operations:** Provide a reliable interface for administrators to execute full real-time CRUD manipulations on student profiles.
- **Implement Session Security:** Incorporate stateful server-side tracking to prevent unauthorized interface infiltration.
- **Demonstrate JEE Competency:** Establish solid runtime operational data pipes using native JDBC driver mappings.

---

## ✨ Features
- **🔒 Secure Authentication Gateway:** Administrative perimeter security utilizing hashed password evaluations and server-side state validations.
- **🕒 Stateful Session Tracking:** HTTP Session persistence ensuring administrative users stay securely logged in across modular page navigation.
- **🛠️ Full Lifecycle CRUD Engine:** Comprehensive modules to seamlessly **Register** new students, **View/Search** live student indices, **Update** profiles, and **Remove** obsolete records.
- **📊 Dynamic JSP Rendering:** Presentation layer styled cleanly with backend data components dynamically outputted via JavaServer Pages tags.
- **📦 Structured Dependency Control:** Fully automated build cycles, deployment war asset production, and package assembly handled cleanly via Apache Maven.

---

## 🏗️ System Architecture Flow
1. **Presentation Layer (Frontend):** Responsive user views designed using HTML/CSS and compiled dynamically on the server via **JSP**.
2. **Application Controller Layer (Middleware):** Core **Java Servlets** intercept incoming client requests, process operational logic, and dictate view routing.
3. **Database Access Layer (Data Pipes):** Native **JDBC (Java Database Connectivity)** queries execute high-speed low-latency prepared statements against the storage server.
4. **Data Persistence Layer (Database):** A centralized **MySQL Database** instances securely stores user logs, profiles, and relational parameters.

---

## 🛠️ Project Component Structure

| Component Path | Technical Operational Purpose |
| :--- | :--- |
| **`src/main/java/`** | House the backend Controller Servlets, Data Access Objects (DAO), and Model classes. |
| **`src/main/webapp/`** | Contains the presentation layer files, including dynamic `.jsp` web views and login portals. |
| **`pom.xml`** | Central Apache Maven configuration handling dependencies like MySQL connector and Servlet APIs. |

---

## 🗄️ Database Schema Design

### 1. `users` (System Credentials)
- `user_id` (INT) - Auto-incrementing Primary Key tracking admin accounts.
- `username` (VARCHAR) - Unique administrative identity login indicator.
- `password` (VARCHAR) - Secure storage strings evaluated during authentication.

### 2. `students` (Core Academic Index)
- `student_id` (INT) - Primary Key tracking unique student academic registration codes.
- `first_name` / `last_name` (VARCHAR) - Legal string indexes identifying individual profiles.
- `email_address` (VARCHAR) - Contact string indices with unique database constraints.
- `enrollment_date` (DATE) - Calendar timestamps recording initial student registration milestones.

---

## 🚀 Local Installation & Deployment

### ⚙️ Prerequisites
Before running the deployment stack, ensure you have installed:
- **JDK 17 or higher**
- **Apache Tomcat Server (v9 or v10)**
- **MySQL Server Instance**
- **Apache Maven**

### 🛠️ Execution Roadmap
1. **Clone the Repo:** Extract these project components onto your workstation.
2. **Configure Database Schema:**
   - Access your local MySQL console and create an isolated schema database.
   - Execute the baseline DDL schema rules to initialize the `users` and `students` data tables.
3. **Setup Connection Context:**
   - Align the JDBC credential strings (Database URL, Username, and Password) inside your Data Access Object (DAO) Java class files.
4. **Assemble with Maven:** Open Command Prompt (CMD) in the root layout containing `pom.xml` and package the application:
   ```bash
   mvn clean package
   ```
5. **Deploy on Web Server:** Drop the generated `.war` target asset into the `webapps` directory of your **Apache Tomcat Server** instance and fire up the server.

---
*Developed for academic innovation assessment, structured JEE enterprise web development, and relational database transactional paradigms.*
