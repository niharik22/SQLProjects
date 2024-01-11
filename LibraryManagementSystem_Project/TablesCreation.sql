USE LMS_PROJECT;

-- Patrons Table
DROP TABLE IF EXISTS Patrons;
CREATE TABLE Patrons (
  PatronID INT PRIMARY KEY,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PatronType VARCHAR(10) NOT NULL
);

-- Authors Table
DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  BirthYear INT DEFAULT NULL
);

-- Books Table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(120) NOT NULL,
  YearPublished INT DEFAULT NULL,
  Cost DECIMAL(8,2) DEFAULT NULL,
  Subject VARCHAR(120) DEFAULT NULL,
  Copies INT DEFAULT 3
);

-- -- Books Table Add inventory
-- ALTER TABLE Books
-- ADD COLUMN Copies INT DEFAULT 3;

-- Transactions Table (Checkouts)
DROP TABLE IF EXISTS Checkouts;
CREATE TABLE Checkouts (
  CheckoutID INT AUTO_INCREMENT PRIMARY KEY,
  BookID INT,
  PatronID INT,
  CheckoutDate DATE DEFAULT NULL,
  DueDate DATE DEFAULT NULL,
  CheckinDate DATE DEFAULT NULL,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID),
  UNIQUE KEY (PatronID, BookID, CheckinDate)
) AUTO_INCREMENT = 1000;

-- Writes Table (Many-to-Many Relationship between Books and Authors)
DROP TABLE IF EXISTS Writes;
CREATE TABLE Writes (
  BookID INT,
  AuthorID INT,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);