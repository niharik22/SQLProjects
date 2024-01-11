-- ADD_BOOK: Adds a new book and its corresponding author to the library system.
DROP PROCEDURE IF EXISTS ADD_BOOK;
DELIMITER //
CREATE PROCEDURE ADD_BOOK(
    IN T_BookID INT,
    IN T_Title VARCHAR(120),
    IN T_YearPublished INT,
    IN T_Cost DECIMAL(8,2),
    IN T_Subject VARCHAR(120),
    IN T_AuthorID INT,
    OUT Result VARCHAR(50))
BEGIN
    DECLARE author_found INT;
    SET author_found = AUTHOR_EXISTS(T_AuthorID);
    IF author_found > 0 THEN
        INSERT INTO BOOKS (BOOKID, TITLE, YearPublished, Cost, Subject) VALUES (T_BookID, T_Title, T_YearPublished, T_Cost, T_Subject);
        INSERT INTO WRITES (BOOKID, AuthorID) VALUES (T_BookID, T_AuthorID);
        SET Result = "Book added successfully.";
    ELSE
        SET Result = "ERROR: Author not found.";
    END IF;
END //
DELIMITER ;

-- ADD_AUTHOR_TO_BOOK: Associates an additional author with an existing book in the library.
DROP PROCEDURE IF EXISTS ADD_AUTHOR_TO_BOOK;
DELIMITER //
CREATE PROCEDURE ADD_AUTHOR_TO_BOOK(
    IN T_BookID INT,
    IN T_AuthorID INT,
    OUT Result VARCHAR(50)
)
BEGIN
    DECLARE author_found INT;
    DECLARE book_found INT;
    SET author_found = AUTHOR_EXISTS(T_AuthorID);
    SET book_found = BOOK_EXISTS(T_BookID);
    IF author_found > 0 AND book_found > 0 THEN
        INSERT INTO WRITES (BOOKID, AuthorID) VALUES (T_BookID, T_AuthorID);
        SET Result = "AUTHOR added TO BOOK successfully.";
    ELSEIF author_found = 0 AND book_found > 0 THEN
        SET Result = "ERROR: Author not found.";
    ELSEIF book_found = 0 AND author_found > 0 THEN
        SET Result = "ERROR: Book not found.";
    ELSE
        SET Result = "ERROR: Author and Book not found.";
    END IF;
END //
DELIMITER ;

-- Checkout_Book: Checks out a book to a patron and records the transaction.
DROP PROCEDURE IF EXISTS Checkout_Book;
DELIMITER //
CREATE PROCEDURE Checkout_Book(
    IN T_BookID INT,
    IN T_PatID INT,
    IN T_CHECKOUT DATE,
    OUT Result VARCHAR(50)
)
BEGIN
    DECLARE book_found INT;
    DECLARE pat_found INT;
    DECLARE book_available INT;
    SET pat_found = PATRON_EXISTS(T_PatID);
    SET book_found = BOOK_EXISTS(T_BookID);
    SET book_available = BOOK_AVAILABLE(T_BookID);
    IF pat_found > 0 AND book_found > 0 THEN
        IF book_available > 0 THEN
            IF T_CHECKOUT IS NULL THEN
                INSERT INTO CHECKOUTS (BookID, PatronID, CheckoutDate, DueDate) VALUES (T_BookID, T_PatID, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 MONTH));
            ELSE 
                INSERT INTO CHECKOUTS (BookID, PatronID, CheckoutDate, DueDate) VALUES (T_BookID, T_PatID, T_CHECKOUT, ADDDATE(T_CHECKOUT, INTERVAL 1 MONTH));
            END IF;
            SET Result = "Book checked out successfully.";
        ELSE 
            SET Result = "ERROR: Book not available to checkout.";
        END IF;
    ELSEIF pat_found = 0 AND book_found > 0 THEN
        SET Result = "ERROR: Patron not found.";
    ELSEIF book_found = 0 AND pat_found > 0 THEN
        SET Result = "ERROR: Book not found.";
    ELSE
        SET Result = "ERROR: Patron and Book not found.";
    END IF;
END //
DELIMITER ;

-- Checkin_Book: Records the return of a checked-out book by a patron.
DROP PROCEDURE IF EXISTS Checkin_Book;
DELIMITER //
CREATE PROCEDURE Checkin_Book(
    IN T_BookID INT,
    IN T_PatID INT,
    IN T_CHECKIN DATE,
    OUT Result VARCHAR(50)
)
BEGIN
    DECLARE valid_checkin INT;
    SET valid_checkin = VALIDATE_CHECKIN(T_BookID, T_PatID);
    IF valid_checkin > 0 THEN
        IF T_CHECKIN IS NULL THEN
            UPDATE CHECKOUTS SET CheckinDate = CURRENT_DATE() WHERE BookID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
        ELSE 
            UPDATE CHECKOUTS SET CheckinDate = T_CHECKIN WHERE BookID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
        END IF;
        SET Result = "Book checked in successfully.";
    ELSE
        SET Result = "ERROR: Not a Valid book to checkin.";
    END IF;
END //
DELIMITER ;

-- Remove_Book: Removes a book and its associated records from the library.
DELIMITER //
CREATE PROCEDURE Remove_Book(IN book_id INT)
BEGIN
    DELETE FROM Writes WHERE BookID = book_id;
    DELETE FROM Books WHERE BookID = book_id;
END //
DELIMITER ;

-- Update_Book_Details: Updates the details of a book in the library.
DELIMITER //
CREATE PROCEDURE Update_Book_Details(
    IN book_id INT,
    IN new_title VARCHAR(120),
    IN new_year INT,
    IN new_cost DECIMAL(8,2),
    IN new_subject VARCHAR(120)
)
BEGIN
    UPDATE Books SET Title = new_title, YearPublished = new_year, Cost = new_cost, Subject = new_subject WHERE BookID = book_id;
END //
DELIMITER ;

-- Register_Patron: Registers a new patron in the library, with validation for patron type.
DELIMITER //
CREATE PROCEDURE Register_Patron(
    IN new_patron_id INT,
    IN first_name VARCHAR(20),
    IN last_name VARCHAR(20),
    IN patron_type VARCHAR(10)
)
BEGIN
    IF patron_type NOT IN ('Student', 'Faculty', 'Staff') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Patron Type';
    ELSE
        INSERT INTO Patrons (PatronID, FirstName, LastName, PatronType) VALUES (new_patron_id, first_name, last_name, patron_type);
    END IF;
END //
DELIMITER ;