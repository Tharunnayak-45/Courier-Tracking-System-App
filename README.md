<div align="center">

# 🚚 Courier Tracking System

> A full-stack web application for **real-time parcel tracking** and seamless admin management — built with Django, Bootstrap 5, and MySQL.

<br>

[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![Django](https://img.shields.io/badge/Django-Framework-092E20?style=for-the-badge&logo=django&logoColor=white)](https://djangoproject.com)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com)
[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com)
[![Status](https://img.shields.io/badge/Status-Completed-22c55e?style=for-the-badge)](#)

<br>

[🎥 View Demo](#demo) · [🚀 Quick Start](#quick-start) · [☁ Deploy to Cloud](#deployment) · [📸 Screenshots](#screenshots)

</div>

---

## 📌 Overview

The **Courier Tracking System (CTS)** streamlines courier management end-to-end. Customers track shipments in real time using a unique tracking number, while administrators manage records, update delivery statuses, and monitor all shipment activity from a central dashboard.

---

## ✨ Features

<table>
<tr>
<td width="33%">

### 👤 User Module
- 🔐 Register & secure login
- 📦 Track courier via tracking ID
- 📋 View real-time shipment status
- 👤 Update personal profile
- 🚪 Logout

</td>
<td width="33%">

### 🛠️ Admin Module
- 🔒 Secure admin dashboard
- ➕ Add new courier records
- 🔄 Update courier status
- 👥 Manage all users
- 📊 View reports & delete records

</td>
<td width="33%">

### 📍 Tracking Module
- 🎫 Unique tracking ID generation
- ⚡ Real-time status updates
- ✅ Delivery confirmation
- 📜 Full tracking history

</td>
</tr>
</table>

---

## 🔄 System Workflow

```
 ┌────────────────────────────────────────────────────────────────┐
 │                                                                │
 │  1. User registers & logs in                                   │
 │         │                                                      │
 │         ▼                                                      │
 │  2. Admin creates courier record (sender, receiver, details)   │
 │         │                                                      │
 │         ▼                                                      │
 │  3. System generates a unique Tracking ID 🎫                   │
 │         │                                                      │
 │         ▼                                                      │
 │  4. User enters Tracking ID → views current shipment status    │
 │         │                                                      │
 │         ▼                                                      │
 │  5. Admin updates transit progress in real time                │
 │         │                                                      │
 │         ▼                                                      │
 │  6. User receives delivery confirmation ✅                      │
 │                                                                │
 └────────────────────────────────────────────────────────────────┘
```

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| **Frontend** | HTML5, CSS3, Bootstrap 5, JavaScript | UI & responsiveness |
| **Backend** | Python, Django | Business logic & routing |
| **Database** | MySQL / SQLite | Data persistence |
| **Tools** | VS Code, Git, GitHub | Development & version control |
| **Server** | Apache Tomcat (local) | Local deployment |

---

## 🚀 Quick Start

### Prerequisites

- Python 3.x
- pip
- MySQL (or SQLite for quick setup)
- Git

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/courier-tracking-system.git
cd courier-tracking-system

# 2. Create and activate a virtual environment
python -m venv venv
source venv/bin/activate      # macOS/Linux
venv\Scripts\activate         # Windows

# 3. Install dependencies
pip install -r requirements.txt

# 4. Configure your database in settings.py
#    (MySQL or SQLite)

# 5. Run migrations
python manage.py makemigrations
python manage.py migrate

# 6. Create a superuser (admin)
python manage.py createsuperuser

# 7. Start the development server
python manage.py runserver
```

Open your browser at `http://127.0.0.1:8000/`

---

## 📸 Screenshots

### 🔐 Login Page
![Login Page](https://github.com/user-attachments/assets/de7f9ef8-b003-4205-9f42-f1f7767a5c82)

### 🏠 Home Page
![Home Page](https://github.com/user-attachments/assets/d764c84a-57b6-46ec-adb6-180fa2119ce8)

### 🔍 Tracking Result
![Tracking Result](https://github.com/user-attachments/assets/2fd59fcc-d216-44a7-9c53-b7c3d63981d1)

### 🛠️ Admin Dashboard
![Admin Dashboard](https://github.com/user-attachments/assets/2a87d7b6-022b-4de3-89e4-d32dc8eea277)

---

## 🌟 Advantages

| | |
|---|---|
| 🚀 **Easy to use** | Clean, intuitive interface for all users |
| ⚡ **Fast tracking** | Real-time status updates with zero delay |
| 🔐 **Secure** | Session-based authentication & admin protection |
| 📄 **Paperless** | Fully digital — no manual record keeping |
| 📊 **Insightful** | Admin reports for full operational visibility |

---

## 🔮 Roadmap

- [ ] 📧 Email notifications on status change
- [ ] 📱 SMS alerts for delivery updates
- [ ] 💳 Online payment gateway integration
- [ ] 🌍 GPS-based live tracking
- [ ] 📲 Mobile application (Android & iOS)
- [ ] ☁️ Cloud deployment (AWS / GCP / Heroku)

---

## 🎓 Conclusion

The Courier Tracking System demonstrates the effective use of modern web technologies — Django, Bootstrap 5, and MySQL — to solve a real-world logistics problem. It provides a clean, secure, and scalable foundation that can be extended with GPS tracking, mobile apps, and payment integrations.

---

## 👨‍💻 Author

<div align="center">

**Mudavath Tharun**

[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/your-username)

*If this project helped you or you found it interesting, please consider giving it a ⭐ — it helps others discover it!*

</div>
