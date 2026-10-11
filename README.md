# FindIt — Lost and Found Web Application

FindIt is a Java-based web application designed to help users report, search for, and recover lost belongings. It provides a centralized platform where users can report lost items, publish found items, search listings, and manage claims.

## Features

- **User Registration and Login:** Allows users to create accounts and log in.
- **Report Lost Items:** Submit details about missing belongings.
- **Report Found Items:** Publish details of items that have been found.
- **Search Items:** Find relevant lost and found listings.
- **Claim Management:** Submit claims to recover found belongings.
- **Admin Dashboard:** Provides administrative access to manage application activities.
- **Claim Processing:** Supports reviewing claims and updating their status.
- **Dashboard:** Provides access to relevant application information.

## Technologies Used

| Technology | Purpose |
|---|---|
| Java | Backend programming |
| Java Servlets | Request handling and application logic |
| JSP | Dynamic web pages |
| JDBC | Database connectivity |
| MySQL | Database management |
| Apache Tomcat 10 | Web application server |
| HTML, CSS, JavaScript | Frontend development |
| Git and GitHub | Version control |
| IntelliJ IDEA | Development environment |

## Project Structure

```text
FindIt/
├── WEB-INF/
│   └── web.xml
├── src/
│   └── com/findit/
│       ├── dao/
│       ├── model/
│       ├── servlet/
│       └── util/
├── addFoundItem.jsp
├── adminDashboard.jsp
├── adminLogin.jsp
├── dashboard.jsp
├── index.jsp
├── login.jsp
├── register.jsp
├── reportFound.jsp
├── reportLost.jsp
├── search.jsp
└── README.md
```

*Note: Update the project structure to match the actual files and folders in your repository.*

## Prerequisites

Before running FindIt, install:

- JDK compatible with your project configuration
- Apache Tomcat 10
- MySQL Server
- IntelliJ IDEA
- MySQL Connector/J

## Installation and Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Bharath-A-eng/FindIt-Lost-and-Found.git
```

### 2. Open the Project

Open the cloned project in IntelliJ IDEA and configure the project JDK.

### 3. Configure the Database

Start MySQL Server and create the database and tables required by the application.

Use the SQL queries and table definitions from the project source code to determine the correct schema.

### 4. Configure the Database Connection

Locate the database connection configuration, expected at:

```text
src/com/findit/util/DBConnection.java
```

Update the connection URL, database name, username, and password to match your local MySQL configuration.

Do not commit real passwords or other sensitive credentials to GitHub.

### 5. Configure Apache Tomcat

Configure Tomcat in IntelliJ IDEA and deploy the FindIt application.

Ensure the project uses compatible Java, Servlet, and Tomcat versions.

### 6. Run the Application

Start the Tomcat server and open the application in your browser:

```text
http://localhost:8080/FindIt/
```

The URL may differ depending on your deployment configuration.

## Security Considerations

- Keep database credentials and secrets out of source control.
- Store passwords using secure password hashing.
- Validate user input on the server.
- Restrict administrative operations to authorized users.
- Use parameterized SQL queries to help prevent SQL injection.

## Future Improvements

- Add screenshots and a live demonstration.
- Improve search and filtering functionality.
- Add email notifications for claim updates.
- Improve the responsive design for mobile devices.
- Add automated testing and deployment documentation.

## Project Objective

FindIt aims to simplify the process of reporting, locating, and recovering lost belongings through an organized web-based platform.

## Developer

**Bharath A-eng**

GitHub: [Bharath-A-eng](https://github.com/Bharath-A-eng)

---

If you find this project useful, consider starring the repository.
