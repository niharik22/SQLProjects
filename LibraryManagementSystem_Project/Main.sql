-- Testing the 'Register_Patron' procedure
CALL Register_Patron(1001, 'John', 'Doe', 'Student');
CALL Register_Patron(1002, 'Jane', 'Smith', 'Faculty');

-- Testing the 'Update_Book_Details' procedure
CALL Update_Book_Details(101, 'Updated Title', 2021, 25.99, 'Science Fiction');

-- Testing the 'Remove_Book' procedure
CALL Remove_Book(102);

-- Testing triggers (Book Checkout and Checkin)
-- Book with ID 103 and patron with ID 1001 exist
INSERT INTO Checkouts (BookID, PatronID, CheckoutDate, DueDate) VALUES (103, 1001, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
UPDATE Checkouts SET CheckinDate = CURDATE() WHERE BookID = 103 AND PatronID = 1001;

-- Testing 'Calculate_Total_Fines' function for a patron
SELECT Calculate_Total_Fines(1001) AS TotalFines;

-- Testing 'Author_Book_Count' function for an author
-- Assuming an author with ID 200 exists
SELECT Author_Book_Count(273) AS NumberOfBooks;

-- Testing 'Most_Popular_Book' function
SELECT Most_Popular_Book() AS MostPopularBookID;

-- Testing 'Patron_Book_History' function for a patron
SELECT Patron_Book_History(1160) AS BookHistory;

-- Testing the 'Register_Patron' procedure
-- Valid registration
CALL Register_Patron(10, 'Alice', 'Johnson', 'Student');

-- Invalid registration (invalid patron type)
CALL Register_Patron(1004, 'Bob', 'Brown', 'Alumnus');

-- Testing the 'Update_Book_Details' procedure
-- Update existing book
CALL Update_Book_Details(104, 'New Science Title', 2022, 30.00, 'Science');

-- Attempt to update non-existing book
CALL Update_Book_Details(999, 'Non-Existent Title', 2023, 15.00, 'Fiction');

-- Testing the 'Remove_Book' procedure
-- Attempt to remove a book that doesn't exist
CALL Remove_Book(999);

-- Testing triggers
-- Inserting a new checkout (valid scenario)
INSERT INTO Checkouts (BookID, PatronID, CheckoutDate, DueDate) VALUES (5241, 1003, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

-- Attempting to checkout a book that has already been checked out and not returned
INSERT INTO Checkouts (BookID, PatronID, CheckoutDate, DueDate) VALUES (5241, 1003, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

-- Returning the book (valid check-in)
UPDATE Checkouts SET CheckinDate = CURDATE() WHERE BookID = 105 AND PatronID = 1003;

-- Testing 'Calculate_Total_Fines' function
-- Patron with no fines
SELECT Calculate_Total_Fines(1003) AS TotalFines;

-- Patron with fines (assuming there are overdue books for PatronID 1001)
SELECT Calculate_Total_Fines(1001) AS TotalFines;

-- Testing 'Author_Book_Count' function
-- Existing author
SELECT Author_Book_Count(201) AS NumberOfBooks;

-- Non-existing author
SELECT Author_Book_Count(999) AS NumberOfBooks;

-- Testing 'Most_Popular_Book' function
SELECT Most_Popular_Book() AS MostPopularBookID;

-- Testing 'Patron_Book_History' function
-- Patron with checkout history
SELECT Patron_Book_History(1001) AS BookHistory;

-- Patron with no checkout history
SELECT Patron_Book_History(1004) AS BookHistory;
