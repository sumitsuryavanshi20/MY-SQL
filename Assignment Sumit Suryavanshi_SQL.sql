#SQL Developer Assignment
#Candidate: Sumit Suryavanshi
#Database: DigitalPaymentsDB

#Create Database
CREATE DATABASE IF NOT EXISTS DigitalPaymentsDB;
USE DigitalPaymentsDB;

#Create Tables

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL
);
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    AccountType ENUM('Savings', 'Current') NOT NULL,
    Balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    DateOpened DATE NOT NULL,

    FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal') NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    TransactionDate DATETIME NOT NULL,
    Status ENUM('Success', 'Failed') NOT NULL,

    FOREIGN KEY (AccountID)
        REFERENCES Accounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#Insert Sample Data

INSERT INTO Users (FirstName, LastName, Email, RegistrationDate) VALUES
('Sumit', 'Suryavanshi', 'sumit@gmail.com', '2025-01-15'),
('Rahul', 'Sharma', 'rahul@gmail.com', '2025-03-10'),
('Priya', 'Verma', 'priya@gmail.com', '2025-06-18'),
('Ankit', 'Gupta', 'ankit@gmail.com', '2024-12-20'),
('Neha', 'Singh', 'neha@gmail.com', '2026-02-11'),
('Riya', 'Kapoor', 'riya@gmail.com', '2026-05-25'),
('Amit', 'Kumar', 'amit@gmail.com', '2025-09-05'),
('Sneha', 'Mishra', 'sneha@gmail.com', '2026-06-15');

INSERT INTO Accounts (UserID, AccountType, Balance, DateOpened) VALUES
(1, 'Savings', 60000.00, '2025-01-15'),
(2, 'Current', 45000.00, '2025-03-12'),
(3, 'Savings', 85000.00, '2025-06-20'),
(4, 'Savings', 20000.00, '2024-12-22'),
(5, 'Current', 95000.00, '2026-02-15'),
(6, 'Savings', 15000.00, '2026-05-28'),
(7, 'Current', 120000.00, '2025-09-10'),
(8, 'Savings', 55000.00, '2026-06-18');

INSERT INTO Transactions
(AccountID, TransactionType, Amount, TransactionDate, Status)
VALUES

(1,'Deposit',70000,'2026-01-05 10:00:00','Success'),
(1,'Withdrawal',10000,'2026-01-08 12:00:00','Success'),

(2,'Deposit',50000,'2026-02-10 11:30:00','Success'),
(2,'Withdrawal',5000,'2026-02-12 09:15:00','Success'),

(3,'Deposit',90000,'2026-03-01 14:20:00','Success'),
(3,'Withdrawal',5000,'2026-03-02 10:00:00','Success'),

(4,'Deposit',25000,'2026-04-05 09:00:00','Success'),
(4,'Withdrawal',5000,'2026-04-06 10:30:00','Success'),

(5,'Deposit',100000,'2026-05-10 13:15:00','Success'),
(5,'Withdrawal',5000,'2026-05-12 15:20:00','Success'),

(6,'Deposit',20000,'2026-06-02 11:10:00','Success'),
(6,'Withdrawal',5000,'2026-06-03 16:00:00','Success'),

(7,'Deposit',150000,'2026-06-15 09:30:00','Success'),
(7,'Withdrawal',30000,'2026-06-18 10:45:00','Success'),

(8,'Deposit',60000,'2026-06-20 12:00:00','Success'),
(8,'Withdrawal',5000,'2026-06-21 13:00:00','Success'),

-- Failed Transactions
(1,'Withdrawal',5000,'2026-06-25 10:00:00','Failed'),
(3,'Deposit',10000,'2026-06-26 09:45:00','Failed'),
(5,'Withdrawal',15000,'2026-06-27 11:20:00','Failed');

UPDATE Accounts
SET Balance = 90000
WHERE AccountID = 5;

#SQL Queries
#Query 1: High-Value Active Users
#Find all users who:
#Registered between January 2025 and June 2026
#Have a total account balance greater than ₹50,000

SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    u.Email,
    u.RegistrationDate,
    SUM(a.Balance) AS TotalBalance
FROM Users u
JOIN Accounts a
    ON u.UserID = a.UserID
WHERE u.RegistrationDate BETWEEN '2025-01-01' AND '2026-06-30'
GROUP BY
    u.UserID,
    u.FirstName,
    u.LastName,
    u.Email,
    u.RegistrationDate
HAVING SUM(a.Balance) > 50000;

#Query 2: Transaction Reconciliation (Failed Audit)
#Requirement
#Show:

#TransactionID
#FirstName
#AccountType
#Amount
#TransactionDate
#for all Failed transaction.

SELECT
    t.TransactionID,
    u.FirstName,
    a.AccountType,
    t.Amount,
    t.TransactionDate
FROM Transactions t
INNER JOIN Accounts a
    ON t.AccountID = a.AccountID
INNER JOIN Users u
    ON a.UserID = u.UserID
WHERE t.Status = 'Failed';

#Query 3: Top 3 Highest Successful Transactions
#equirement
#Find the top 3 highest successful transaction amounts.

SELECT
    TransactionID,
    AccountID,
    Amount,
    TransactionDate
FROM Transactions
WHERE Status = 'Success'
ORDER BY Amount DESC
LIMIT 3;

#Query 4: Monthly Operational Aggregation (MIS Report)
#Requirement
#For successful transactions, show:
#Month
#Transaction Type
#Number of transactions
#Total transaction value

SELECT
    DATE_FORMAT(TransactionDate, '%Y-%m') AS Month,
    TransactionType,
    COUNT(*) AS TotalTransactions,
    SUM(Amount) AS TotalAmount
FROM Transactions
WHERE Status = 'Success'
GROUP BY
    DATE_FORMAT(TransactionDate, '%Y-%m'),
    TransactionType
ORDER BY Month;

#Query 5: Data Integrity Audit (Anomaly Detection)
#Requirement

#Find accounts where:
SELECT
    a.AccountID,
    a.Balance,
    COALESCE(SUM(
        CASE
            WHEN t.TransactionType = 'Deposit' THEN t.Amount
            WHEN t.TransactionType = 'Withdrawal' THEN -t.Amount
        END
    ), 0) AS CalculatedBalance
FROM Accounts a
LEFT JOIN Transactions t
    ON a.AccountID = t.AccountID
    AND t.Status = 'Success'
GROUP BY
    a.AccountID,
    a.Balance
HAVING a.Balance <> CalculatedBalance;

