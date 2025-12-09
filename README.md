📌 Little Lemon Database Project

This repository contains the complete implementation of the Little Lemon Booking System, including database schema, stored procedures, Python integration scripts, Tableau analysis, and ER diagrams.
The project is created as part of the Peer-graded Assignment.

📂 Project Structure
little-lemon-project/
│
├── ERD/                     # PNG screenshots of ER diagram
│   └── little_lemon_erd.png
│
├── SQL/
│   └── little_lemon_schema.sql     # Full database schema
│   └── procedures.sql              # Stored procedures
│
├── Python/
│   └── main.py                     # Python database client
│   └── manage_booking.py
│
├── Tableau/
│   └── little_lemon.twbx           # Tableau workbook
│
└── README.md

🛠 1. Database Schema

All tables required for the Little Lemon booking system are implemented in:

📄 SQL/little_lemon_schema.sql

Includes tables:

Customers

Bookings

Menu

Orders

OrderDetails

Staff

All foreign keys, constraints, and datatypes are properly applied.

📘 2. ER Diagram

The ER diagram illustrates the relationships between all tables (1-to-many, many-to-many).

📄 File: ERD/little_lemon_erd.png

🐍 3. Python Integration

Python is used to:

Connect to MySQL database

Call stored procedures

Display booking results

Add, update, manage, and cancel bookings

The main client is in:

📄 Python/main.py

Python uses:

import mysql.connector

⚙️ 4. Stored Procedures

All required procedures have been implemented:

✔ GetMaxQuantity()

Returns maximum quantity ordered from OrderDetails.

✔ ManageBooking()

Core logic for handling booking operations.

✔ UpdateBooking()

Updates an existing booking.

✔ AddBooking()

Adds a new booking to the database.

✔ CancelBooking()

Sets the booking status to "Cancelled".

All procedures are included in:

📄 SQL/procedures.sql

📊 5. Tableau Analysis

The Tableau workbook includes:

Visual dashboard

Customer reservation analysis

Peak booking times

Most ordered menu items

Total sales analysis

File:

📄 Tableau/little_lemon.twbx

🚀 How to Run
1. Import the SQL schema:
SOURCE little_lemon_schema.sql;

2. Load stored procedures:
SOURCE procedures.sql;

3. Run Python client:
python main.py

4. Open Tableau:

Connect to MySQL

Load workbook: little_lemon.twbx

📎 Project Requirements Checklist
Requirement	Status
GitHub repository created	✔
Database schema implemented	✔
ER diagram included	✔
Python connection implemented	✔
GetMaxQuantity() procedure	✔
ManageBooking() procedure	✔
UpdateBooking() procedure	✔
AddBooking() procedure	✔
CancelBooking() procedure	✔
Tableau workbook added	✔

This project fully meets the instructor checklist for peer review.

👤 Author

Abdukamol Homidov
Little Lemon Booking System Developer
