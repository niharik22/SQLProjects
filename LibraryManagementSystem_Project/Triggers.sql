-- Trigger to Update Book Availability on Checkout
DELIMITER //
CREATE TRIGGER After_Book_Checkout
AFTER INSERT ON Checkouts
FOR EACH ROW
BEGIN
    UPDATE Books
    SET Copies = Copies - 1
    WHERE BookID = NEW.BookID;
END //
DELIMITER ;

-- Trigger to Update Book Availability on Checkin
DELIMITER //
CREATE TRIGGER After_Book_Checkin
AFTER UPDATE ON Checkouts
FOR EACH ROW
BEGIN
    IF NEW.CheckinDate IS NOT NULL THEN
        UPDATE Books
        SET Copies = Copies + 1
        WHERE BookID = NEW.BookID;
    END IF;
END //
DELIMITER ;

-- Trigger to Prevent Duplicate Checkouts
DELIMITER //
CREATE TRIGGER Prevent_Duplicate_Checkout
BEFORE INSERT ON Checkouts
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM Checkouts WHERE BookID = NEW.BookID AND PatronID = NEW.PatronID AND CheckinDate IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate checkout not allowed';
    END IF;
END //
DELIMITER ;

-- Trigger to Validate Book Copies on Insert
DELIMITER //
CREATE TRIGGER Validate_Book_Copies
BEFORE INSERT ON Books
FOR EACH ROW
BEGIN
    IF NEW.Copies < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Copies count cannot be negative';
    END IF;
END //
DELIMITER ;