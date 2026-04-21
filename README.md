# 🚀 Employee Login Portal (Full Stack Web App)

A full-stack web application that allows employees to register, log in, and manage their profile, while managers can view and manage all employee data through a dashboard.

---

## 📌 Features

### 🔐 Authentication

* Employee & Manager Login
* Secure password hashing using bcrypt
* JWT-based authentication
* Role-based access control

### 👨‍💼 Employee Portal

* Register and login
* View & update personal profile
* Add professional details:

  * Department
  * Job Title
  * Experience
  * Salary
  * Skills

### 🧑‍💻 Manager Portal

* Login as Manager
* View all employees
* Search, filter & sort employees
* Update/Delete employee records

---

## 🛠️ Tech Stack

**Frontend:**

* HTML
* CSS
* JavaScript
* Bootstrap

**Backend:**

* Node.js
* Express.js

**Database:**

* MySQL (XAMPP / phpMyAdmin)

---

## 📁 Project Structure

```
employee-portal/
│
├── backend/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── middleware/
│   ├── config/
│   ├── server.js
│
├── frontend/
│   ├── html files
│   ├── css/
│   ├── js/
│
├── database/
│   └── schema.sql
│
└── README.md
```

---

## 📸 Screenshots

### 🔐 Login Page
<img width="1903" height="913" alt="login " src="https://github.com/user-attachments/assets/f553cde2-7e83-433b-b9b3-9627d2213b93" />

---

### 📝 Register Page
<img width="1890" height="908" alt="Register" src="https://github.com/user-attachments/assets/9ddf8502-7cf0-4983-9a4d-c28285fcb6d8" />

--- 

### 👨‍💼 Employee Page
<img width="1904" height="918" alt="Emp Dashboard " src="https://github.com/user-attachments/assets/64b029c5-662d-4599-b0fc-3d3278e68560" />

---

<img width="1886" height="913" alt="Emp Profile " src="https://github.com/user-attachments/assets/6c683d41-9b35-4e01-8a4e-609eb5cefc25" />

---

<img width="1886" height="910" alt="Emp Edit Profile " src="https://github.com/user-attachments/assets/df182c7b-0c6d-4163-b432-9e23182e1a36" />

---

### 📊 Manager Page 
<img width="1900" height="910" alt="Manager Dashboard" src="https://github.com/user-attachments/assets/9d814cce-10d2-45ac-8668-121aa70be76e" />

---

<img width="1900" height="907" alt="Manager Emp" src="https://github.com/user-attachments/assets/5faaae9c-d2f8-4704-bc85-aea143fe2f46" />

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```
git clone https://github.com/HemaRamachandran28/employee-portal.git
cd employee-portal
```

---

### 2️⃣ Setup Database (XAMPP)

* Start Apache & MySQL in XAMPP
* Open phpMyAdmin → http://localhost/phpmyadmin
* Import `schema.sql`

---

### 3️⃣ Configure Backend

Create a `.env` file inside `backend/`:

```
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=employee_portal
JWT_SECRET=your_secret_key
```

---

### 4️⃣ Install Dependencies

```
cd backend
npm install
```

---

### 5️⃣ Run the Server

```
npm start
```

Server will run at:
👉 http://localhost:5000

---

## 🔑 Default Login Credentials

| Role     | Email                                           | Password     |
| -------- | ----------------------------------------------- | ------------ |
| Manager  | [manager@portal.com](mailto:manager@portal.com) | Password@123 |
| Employee | [arjun@portal.com](mailto:arjun@portal.com)     | Password@123 |

---

## 📊 API Endpoints (Sample)

* POST `/api/auth/register`
* POST `/api/auth/login`
* GET `/api/employees`
* PUT `/api/employees/:id`
* DELETE `/api/employees/:id`

---

## 🚀 Future Enhancements

* 📈 Analytics Dashboard (Charts)
* 📄 Resume Upload & Parsing (AI feature)
* 🔔 Email Notifications
* 📱 Mobile Responsive UI Improvements
* 🌐 Deployment (Render / Railway / Vercel)

---

## 🙌 Author

**Hema Ramachandran**
Aspiring Data Analyst & Developer

---

## ⭐ If you like this project

Give it a star ⭐ on GitHub!
