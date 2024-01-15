-- Testing the 'Register_Patron' procedure
-- Valid registration
CALL Register_Patron(1246, 'Cena', 'Rayes', 'Student');

-- Invalid registration (invalid patron type)
CALL Register_Patron(1247, 'Bob', 'Brown', 'Alumnus');

-- Testing the 'Update_Book_Details' procedure
-- Update existing book
CALL Update_Book_Details(5237, 'Mastering the database environment', 2020, 102.00, 'Database', @result);
SELECT @result;

-- Attempt to update non-existing book
CALL Update_Book_Details(999, 'Non-Existent Title', 2023, 15.00, 'Fiction', @result);
SELECT @result;

-- Testing the 'Remove_Book' procedure
-- Attempt to remove a book that doesn't exist
CALL Remove_Book(999, @result);
SELECT @result;

-- Testing triggers

-- Testing valid checkout scenario
CALL Checkout_Book(5240, 1003, CURDATE(), @ResultMessage);
SELECT @ResultMessage AS 'Checkout Result';

-- Testing invalid checkout scenario - patron not found
CALL Checkout_Book(5239, 1004, CURDATE(), @ResultMessage);
SELECT @ResultMessage AS 'Checkout Result';

-- Testing invalid checkout scenario (attempting to checkout a book that is already checked out)
CALL Checkout_Book(5241, 1003, CURDATE(), @ResultMessage);

-- Returning the book 
-- Testing valid check-in scenario
CALL Checkin_Book(5239, 1003, CURDATE(), @ResultMessage);
SELECT @ResultMessage AS 'Check-in Result';

-- Testing invalid check-in scenario
CALL Checkin_Book(105, 1003, CURDATE(), @ResultMessage);
SELECT @ResultMessage AS 'Check-in Result';

-- Testing 'Calculate_Total_Fines' function

-- Patron with fines
SELECT Calculate_Total_Fines(1171) AS TotalFines;

-- Patron with no fines
SELECT Calculate_Total_Fines(1003) AS TotalFines;

-- Patron with no books checked out
SELECT Calculate_Total_Fines(1001) AS TotalFines;

-- Testing 'Author_Book_Count' function
-- Existing author
SELECT Author_Book_Count(262) AS NumberOfBooks;

-- Non-existing author
SELECT Author_Book_Count(999) AS NumberOfBooks;

-- Testing 'Most_Popular_Book' function
SELECT Most_Popular_Book() AS MostPopularBookID;

-- Testing 'Patron_Book_History' function
-- Patron with checkout history
SELECT Patron_Book_History(1171) AS BookHistory;

-- Patron with no checkout history
SELECT Patron_Book_History(1004) AS BookHistory;
