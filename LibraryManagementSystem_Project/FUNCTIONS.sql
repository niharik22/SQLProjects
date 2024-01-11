-- AUTHOR_EXISTS: Checks if an author exists in the AUTHORS table by AuthorID.

DROP FUNCTION IF EXISTS AUTHOR_EXISTS;
DELIMITER //
CREATE FUNCTION AUTHOR_EXISTS(T_AUTHOR_ID INT) RETURNS INT(1) DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(AuthorID) INTO RESULT FROM AUTHORS WHERE AuthorID = T_AUTHOR_ID;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END //
DELIMITER ;

-- BOOK_EXISTS: Checks if a book exists in the BOOKS table by BookID.

DROP FUNCTION IF EXISTS BOOK_EXISTS;
DELIMITER //
CREATE FUNCTION BOOK_EXISTS(T_BOOK_NUM INT) RETURNS INT(1) DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(BOOKID) INTO RESULT FROM BOOKS WHERE BOOKID = T_BOOK_NUM;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END //
DELIMITER ;

-- CALCULATE_OPEN_FINE: Calculates the fine for a book if it's overdue.

DROP FUNCTION IF EXISTS CALCULATE_OPEN_FINE;
DELIMITER //
CREATE FUNCTION CALCULATE_OPEN_FINE(T_BOOK_NUM INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
  DECLARE CDD DATE;
  DECLARE DaysLate INT;
  DECLARE RESULT VARCHAR(50);

  SELECT DueDate INTO CDD FROM CHECKOUTS
  WHERE BookID = T_BOOK_NUM AND CheckinDate IS NULL;
  IF CDD IS NOT NULL THEN
    SET DaysLate = DATEDIFF(CURRENT_DATE(), CDD);
    IF DaysLate > 0 THEN
      SET RESULT = CONCAT('Fine is $ ', DaysLate);
    ELSE
      SET RESULT = 'No Fine';
    END IF;
  ELSE
    SET RESULT = concat('No pending fine on Book: ', T_BOOK_NUM);
  END IF;

  RETURN RESULT;
END //
DELIMITER ;



-- PATRON_EXISTS: Checks if a patron exists in the PATRONS table by PatronID.

DROP FUNCTION IF EXISTS PATRON_EXISTS;
DELIMITER //
CREATE FUNCTION PATRON_EXISTS(T_PAT_ID INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(PatronID) INTO RESULT FROM PATRONS WHERE PatronID = T_PAT_ID;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END //
DELIMITER ;


-- BOOK_AVAILABLE: Checks if a book is available for checkout.

DROP FUNCTION IF EXISTS BOOK_AVAILABLE;
DELIMITER //
CREATE FUNCTION BOOK_AVAILABLE(T_BOOK_NUM INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COPIES INTO RESULT FROM BOOKS WHERE BOOKID = T_BOOK_NUM;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END //
DELIMITER ;


-- Validate_Checkin: Validates if a book can be checked in by a patron.

DROP FUNCTION IF EXISTS Validate_Checkin;
DELIMITER //
CREATE FUNCTION Validate_Checkin(T_BookID INT, T_PatID INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(CheckoutID) INTO RESULT FROM CHECKOUTS 
  WHERE BOOKID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END //
DELIMITER ;


-- Calculate_Total_Fines: Calculates the total fines for a patron based on overdue books.

DELIMITER //
CREATE FUNCTION Calculate_Total_Fines(patron_id INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE total_fine DECIMAL(10,2) DEFAULT 0;
    SELECT SUM(IF(CheckinDate IS NULL AND DueDate < CURRENT_DATE, DATEDIFF(CURRENT_DATE, DueDate), 0)) INTO total_fine
    FROM Checkouts
    WHERE PatronID = patron_id;
    RETURN total_fine;
END //
DELIMITER ;


-- Author_Book_Count: Returns the number of books registered under a specific author.

DELIMITER //
CREATE FUNCTION Author_Book_Count(author_id INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE count_books INT;
    SELECT COUNT(*) INTO count_books FROM Writes WHERE AuthorID = author_id;
    RETURN count_books;
END //
DELIMITER ;


-- Most_Popular_Book: Identifies the most frequently checked-out book.

DELIMITER //
CREATE FUNCTION Most_Popular_Book() RETURNS INT DETERMINISTIC
BEGIN
    DECLARE popular_book INT;
    SELECT BookID INTO popular_book FROM Checkouts
    GROUP BY BookID
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    RETURN popular_book;
END //
DELIMITER ;


-- Patron_Book_History: Provides a list of all the books checked out by a specific patron.

DELIMITER //
CREATE FUNCTION Patron_Book_History(patron_id INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE history TEXT DEFAULT '';
    SELECT GROUP_CONCAT(CONCAT('BookID: ', BookID, ', Checkout: ', CheckoutDate, ', Return: ', IFNULL(CheckinDate, 'Not Returned')) SEPARATOR '; ') INTO history
    FROM Checkouts
    WHERE PatronID = patron_id;
    RETURN history;
END //
DELIMITER ;