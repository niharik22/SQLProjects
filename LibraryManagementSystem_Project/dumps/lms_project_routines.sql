CREATE DATABASE  IF NOT EXISTS `lms_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms_project`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_project
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'lms_project'
--

--
-- Dumping routines for database 'lms_project'
--
/*!50003 DROP FUNCTION IF EXISTS `Author_Book_Count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Author_Book_Count`(author_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE count_books INT;
    SELECT COUNT(*) INTO count_books FROM Writes WHERE AuthorID = author_id;
    RETURN count_books;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `AUTHOR_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `AUTHOR_EXISTS`(T_AUTHOR_ID INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(AuthorID) INTO RESULT FROM AUTHORS WHERE AuthorID = T_AUTHOR_ID;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `BOOK_AVAILABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `BOOK_AVAILABLE`(T_BOOK_NUM INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COPIES INTO RESULT FROM BOOKS WHERE BOOKID = T_BOOK_NUM;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `BOOK_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `BOOK_EXISTS`(T_BOOK_NUM INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(BOOKID) INTO RESULT FROM BOOKS WHERE BOOKID = T_BOOK_NUM;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CALCULATE_OPEN_FINE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULATE_OPEN_FINE`(T_BOOK_NUM INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Calculate_Total_Fines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculate_Total_Fines`(patron_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_fine DECIMAL(10,2) DEFAULT 0;
    SELECT SUM(IF(CheckinDate IS NULL AND DueDate < CURRENT_DATE, DATEDIFF(CURRENT_DATE, DueDate), 0)) INTO total_fine
    FROM Checkouts
    WHERE PatronID = patron_id;
    RETURN total_fine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Most_Popular_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Most_Popular_Book`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE popular_book INT;
    SELECT BookID INTO popular_book FROM Checkouts
    GROUP BY BookID
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    RETURN popular_book;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Patron_Book_History` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Patron_Book_History`(patron_id INT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE history TEXT DEFAULT '';
    SELECT GROUP_CONCAT(CONCAT('BookID: ', BookID, ', Checkout: ', CheckoutDate, ', Return: ', IFNULL(CheckinDate, 'Not Returned')) SEPARATOR '; ') INTO history
    FROM Checkouts
    WHERE PatronID = patron_id;
    RETURN history;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PATRON_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PATRON_EXISTS`(T_PAT_ID INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(PatronID) INTO RESULT FROM PATRONS WHERE PatronID = T_PAT_ID;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Validate_Checkin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Validate_Checkin`(T_BookID INT, T_PatID INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE RESULT INT;
  SELECT COUNT(CheckoutID) INTO RESULT FROM CHECKOUTS 
  WHERE BOOKID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
  IF RESULT > 0 THEN
    RETURN 1; -- True
  ELSE
    RETURN 0; -- False
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_AUTHOR_T0_BOOK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_AUTHOR_T0_BOOK`(
    IN T_BookID INT,
    IN T_AuthorID INT,
    OUT Result VARCHAR(50)
)
BEGIN
    DECLARE author_found INT;
    DECLARE book_found INT;
    -- Call the AUTHOR_EXISTS function to check if the author exists
    SET author_found = AUTHOR_EXISTS(T_AuthorID);
    SET book_found = BOOK_EXISTS(T_BookID);

    IF author_found > 0 AND book_found > 0 THEN
        -- Author exists, proceed with the insertion
        INSERT INTO WRITES (BOOK_NUM, AU_ID) VALUES (T_BookID, T_AuthorID);
        SET Result = "AUTHOR added TO BOOK successfully.";
    ELSEIF author_found = 0 AND book_found > 0 THEN
        -- Author does not exist, set the error message
        SET Result = "ERROR: Author not found.";
    ELSEIF book_found = 0 AND author_found > 0 THEN
        -- Book does not exist, set the error message
        SET Result = "ERROR: Book not found.";
    ELSE
        SET Result = "ERROR: Author and Book not found.";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_BOOK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_BOOK`(
    IN T_BookID INT,
    IN T_Title VARCHAR(120),
    IN T_YearPublished INT,
    IN T_Cost DECIMAL(8,2),
    IN T_Subject VARCHAR(120),
    IN T_AuthorID INT,
    OUT Result VARCHAR(50))
BEGIN
    DECLARE author_found INT;
    -- Call the AUTHOR_EXISTS function to check if the author exists
    SET author_found = AUTHOR_EXISTS(T_AuthorID);
    IF author_found > 0 THEN
        -- Author exists, proceed with the insertion
        INSERT INTO BOOKS (BOOKID, TITLE, YearPublished, Cost, Subject) VALUES (T_BookID, T_Title, T_YearPublished, T_Cost, T_Subject);
        INSERT INTO WRITES (BOOKID, AuthorID) VALUES (T_BookID, T_AuthorID);
        SET Result = "Book added successfully.";
    ELSE
        -- Author does not exist, set the error message
        SET Result = "ERROR: Author not found.";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Checkin_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Checkin_Book`(
    IN T_BookID INT,
    IN T_PatID INT,
    IN T_CHECKIN DATE,
    OUT Result VARCHAR(50)
)
BEGIN
    DECLARE valid_checkin INT;

    SET valid_checkin = VALIDATE_CHECKIN(T_BookID,T_PatID);
    
    IF valid_checkin > 0 THEN
            IF T_CHECKIN IS NULL THEN
				UPDATE CHECKOUTS SET CheckinDate = CURRENT_DATE() 
                WHERE BookID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
            ELSE 
                UPDATE CHECKOUTS SET CheckinDate = T_CHECKIN
                WHERE BookID = T_BookID AND PatronID = T_PatID AND CheckinDate IS NULL;
            END IF;
            UPDATE BOOKS SET COPIES = COPIES + 1 WHERE BookID = T_BookID;
            SET Result = "Book checked in successfully.";
    ELSE
        SET Result = "ERROR: Not a Valid book to checkin.";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Checkout_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Checkout_Book`(
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
        -- Both patron and book found
        IF book_available > 0 THEN
            IF T_CHECKOUT IS NULL THEN
                INSERT INTO CHECKOUTS (BookID, PatronID, CheckoutDate, DueDate) 
                VALUES (T_BookID, T_PatID, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 MONTH));
            ELSE 
                INSERT INTO CHECKOUTS (BookID, PatronID, CheckoutDate, DueDate) 
                VALUES (T_BookID, T_PatID, T_CHECKOUT, ADDDATE(T_CHECKOUT, INTERVAL 1 MONTH));
            END IF;
            UPDATE BOOKS SET COPIES = COPIES - 1 WHERE BookID = T_BookID; -- Assuming BOOK_NUM is the correct column name
            SET Result = "Book checked out successfully.";
        ELSE 
            SET Result = "ERROR: Book not available to checkout.";
        END IF;
    ELSEIF pat_found = 0 AND book_found > 0 THEN
        -- Patron does not exist
        SET Result = "ERROR: Patron not found.";
    ELSEIF book_found = 0 AND pat_found > 0 THEN
        -- Book does not exist
        SET Result = "ERROR: Book not found.";
    ELSE
        -- Neither patron nor book found
        SET Result = "ERROR: Patron and Book not found.";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Register_Patron` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Register_Patron`(
    IN new_patron_id INT,
    IN first_name VARCHAR(20),
    IN last_name VARCHAR(20),
    IN patron_type VARCHAR(10)
)
BEGIN
    -- Validation for patron type
    IF patron_type NOT IN ('Student', 'Faculty', 'Staff') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Patron Type';
    ELSE
        -- Insert the new patron record into the Patrons table
        INSERT INTO Patrons (PatronID, FirstName, LastName, PatronType)
        VALUES (new_patron_id, first_name, last_name, patron_type);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Remove_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Book`(IN book_id INT)
BEGIN
    -- First, remove entries from the Writes table
    DELETE FROM Writes WHERE BookID = book_id;

    -- Then, remove the book from the Books table
    DELETE FROM Books WHERE BookID = book_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Book_Details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Book_Details`(
    IN book_id INT,
    IN new_title VARCHAR(120),
    IN new_year INT,
    IN new_cost DECIMAL(8,2),
    IN new_subject VARCHAR(120)
)
BEGIN
    UPDATE Books
    SET Title = new_title,
        YearPublished = new_year,
        Cost = new_cost,
        Subject = new_subject
    WHERE BookID = book_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10 20:22:11
