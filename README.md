# 🛒 E-Commerce Web App (JSP + Servlet + MySQL)

This is a simple full-stack e-commerce web application built using **JSP**, **Servlets**, **JDBC**, **Tomcat**, and **MySQL**.

## 📌 Features

- ✅ User Registration & Login
- ✅ Admin Panel (Add/Edit/Delete Products)
- ✅ Add to Cart Functionality
- ✅ View Cart & Checkout
- ✅ Order History (User Side)
- ✅ Order Dashboard & Stats (Admin Side)
- ✅ Session Management & Logout
- ✅ MySQL Database Integration

---

## 🧰 Tech Stack

- Frontend: HTML, CSS, Bootstrap, JSP
- Backend: Java (Servlets, JSP)
- Database: MySQL
- Server: Apache Tomcat
- Tools: Eclipse IDE, JDBC, Git

---

## 📁 Project Structure
E-Commerce/
├── src/
│ └── com/ecommerce/
│ ├── connection/
│ ├── dao/
│ ├── model/
│ └── servlet/
├── WebContent/
│ ├── css/, images/
│ ├── index.jsp, login.jsp, cart.jsp, etc.
│ └── admin_dashboard.jsp, add_product.jsp, etc.
├── pom.xml (if using Maven)


---

## 🛠️ Setup Instructions (Local)

### ✅ Step 1: Clone the Repository

```
git clone https://github.com/your-username/E-Commerce.git
cd E-Commerce
```
### ✅ Step 2: Import into Eclipse
```
1. Open Eclipse IDE

2. Go to: File → Import → Dynamic Web Project

3. Choose this project folder

4. Configure Apache Tomcat 10+
```
### 🗃️ Step 3: Setup MySQL Database
```
📌 Database Name: ecommerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(100)
);

CREATE TABLE admins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100),
  password VARCHAR(100)
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  price DOUBLE,
  image_url VARCHAR(255)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_name VARCHAR(100),
  quantity INT DEFAULT 1,
  price DOUBLE,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Default admin
INSERT INTO admins (username, password) VALUES ('admin', 'admin123');

-- Sample Products
INSERT INTO products (name, description, price, image_url) VALUES
('Red T-Shirt', '100% cotton red t-shirt', 499, 'red-tshirt.jpg'),
('Running Shoes', 'Durable and lightweight running shoes', 2499, 'shoes.jpg'),
('Blue Jeans', 'Classic blue denim jeans', 1299, 'blue-jeans.jpg');
```
### 🔌 Step 4: Configure Database Connection
Update DBConnection.java:
```
public class DBConnection {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ecommerce", "root", "your_password"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
```

### ▶️ Step 5: Run the Project
```
1. Right-click the project → Run on Server

2. Visit: http://localhost:8080/E-Commerce/
```
### 👩‍💼 Admin Login
```
URL: http://localhost:8080/E-Commerce/admin_login.jsp
Username: admin
Password: admin123
```
### 🤝 Contributing
```
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
```
### 🙋‍♀️ Author
👩‍💻 Sanjana Yadav
📧 Email: [sanjanayadav3952@gmail.com]
🌐 GitHub: https://github.com/Sanjanayadav07





 

