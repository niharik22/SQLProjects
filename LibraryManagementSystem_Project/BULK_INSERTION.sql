-- Insert data into Authors table
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES
(185, 'Benson', 'Reeves', 1990),
(218, 'Rachel', 'Beatney', 1983),
(229, 'Carmine', 'Salvadore', NULL),
(251, 'Hugo', 'Bruer', 1972),
(262, 'Xia', 'Chiang', NULL),
(273, 'Reba', 'Durante', 1969),
(284, 'Trina', 'Tankersly', 1961),
(383, 'Neal', 'Walsh', 1980),
(394, 'Robert', 'Lake', 1982),
(438, 'Perry', 'Pearson', 1986),
(460, 'Connie', 'Paulsen', 1983),
(559, 'Rachel', 'McGill', NULL),
(581, 'Manish', 'Aggerwal', 1984),
(592, 'Lawrence', 'Sheel', 1976),
(603, 'Julia', 'Palca', 1988);


-- Insert data into Patrons table using standard INSERT INTO
INSERT INTO Patrons (PatronID, FirstName, LastName, PatronType) VALUES
(1160, 'Robert', 'Carter', 'Faculty'),
(1161, 'Kelsey', 'Koch', 'Faculty'),
(1165, 'Cedric', 'Baldwin', 'Faculty'),
(1166, 'Vera', 'Alvarado', 'Student'),
(1167, 'Alan', 'Martin', 'Faculty'),
(1170, 'Cory', 'Barry', 'Faculty'),
(1171, 'Peggy', 'Marsh', 'Student'),
(1172, 'Tony', 'Miles', 'Student'),
(1174, 'Betsy', 'Malone', 'Student'),
(1180, 'Nadine', 'Blair', 'Student'),
(1181, 'Allen', 'Horne', 'Student'),
(1182, 'Jamal', 'Melendez', 'Student'),
(1183, 'Helena', 'Hughes', 'Faculty'),
(1184, 'Jimmie', 'Love', 'Student'),
(1185, 'Sandra', 'Yang', 'Student'),
(1200, 'Lorenzo', 'Torres', 'Student'),
(1201, 'Shelby', 'Noble', 'Student'),
(1202, 'Holly', 'Anthony', 'Student'),
(1203, 'Tyler', 'Pope', 'Student'),
(1204, 'Thomas', 'Duran', 'Student'),
(1205, 'Claire', 'Gomez', 'Student'),
(1207, 'Iva', 'Ramos', 'Student'),
(1208, 'Ollie', 'Cantrell', 'Student'),
(1209, 'Rena', 'Mathis', 'Student'),
(1210, 'Keith', 'Cooley', 'Student'),
(1211, 'Jerald', 'Gaines', 'Student'),
(1212, 'Iva', 'McClain', 'Student'),
(1213, 'Desiree', 'Rivas', 'Student'),
(1214, 'Marina', 'King', 'Student'),
(1215, 'Maureen', 'Downs', 'Student'),
(1218, 'Angel', 'Terrell', 'Student'),
(1219, 'Desiree', 'Harrington', 'Student'),
(1220, 'Carlton', 'Morton', 'Student'),
(1221, 'Gloria', 'Pitts', 'Student'),
(1222, 'Zach', 'Kelly', 'Student'),
(1223, 'Jose', 'Hays', 'Student'),
(1224, 'Jewel', 'England', 'Student'),
(1225, 'Wilfred', 'Fuller', 'Student'),
(1226, 'Jeff', 'Owens', 'Student'),
(1227, 'Alicia', 'Dickson', 'Student'),
(1228, 'Homer', 'Goodman', 'Student'),
(1229, 'Gerald', 'Burke', 'Student'),
(1237, 'Brandi', 'Larson', 'Student'),
(1238, 'Erika', 'Bowen', 'Student'),
(1239, 'Elton', 'Irwin', 'Student'),
(1240, 'Jan', 'Joyce', 'Student'),
(1241, 'Irene', 'West', 'Student'),
(1242, 'Mario', 'King', 'Student'),
(1243, 'Roberto', 'Kennedy', 'Student'),
(1244, 'Leon', 'Richmond', 'Student');


-- Call the ADD_BOOK procedure for each record
CALL ADD_BOOK(5235, 'Beginner''s Guide to JAVA', 2014, 59.95, 'Programming', 273, @RESULT);
CALL ADD_BOOK(5236, 'Database in the Cloud', 2014, 79.95, 'Cloud', 383, @RESULT);
CALL ADD_BOOK(5237, 'Mastering the database environment', 2015, 89.95, 'Database', 185, @RESULT);
CALL ADD_BOOK(5238, 'Conceptual Programming', 2015, 59.95, 'Programming', 603, @RESULT);
CALL ADD_BOOK(5239, 'J++ in Mobile Apps', 2015, 49.95, 'Programming', 229, @RESULT);
CALL ADD_BOOK(5240, 'iOS Programming', 2015, 79.95, 'Programming', 218, @RESULT);
CALL ADD_BOOK(5241, 'JAVA First Steps', 2015, 49.95, 'Programming', 460, @RESULT);
CALL ADD_BOOK(5242, 'C# in Middleware Deployment', 2015, 59.95, 'Middleware', 581, @RESULT);
CALL ADD_BOOK(5243, 'DATABASES in Theory', 2015, 129.95, 'Database', 251, @RESULT);
CALL ADD_BOOK(5244, 'Cloud-based Mobile Applications', 2015, 69.95, 'Cloud', 262, @RESULT);
CALL ADD_BOOK(5245, 'The Golden Road to Platform independence', 2016, 119.95, 'Middleware', 394, @RESULT);
CALL ADD_BOOK(5246, 'Capture the Cloud', 2016, 69.95, 'Cloud', 251, @RESULT);
CALL ADD_BOOK(5247, 'Shining Through the Cloud: Sun Programming', 2016, 109.95, 'Programming', 394, @RESULT);
CALL ADD_BOOK(5248, 'What You Always Wanted to Know About Database, But Were Afraid to Ask', 2016, 49.95, 'Database', 229, @RESULT);
CALL ADD_BOOK(5249, 'Starlight Applications', 2016, 69.95, 'Cloud', 262, @RESULT);
CALL ADD_BOOK(5250, 'Reengineering the Middle Tier', 2016, 89.95, 'Middleware', 383, @RESULT);
CALL ADD_BOOK(5251, 'Thoughts on Revitalizing Ruby', 2016, 59.95, 'Programming', 460, @RESULT);
CALL ADD_BOOK(5252, 'Beyond the Database Veil', 2016, 69.95, 'Database', 262, @RESULT);
CALL ADD_BOOK(5253, 'Virtual Programming for Virtual Environments', 2016, 79.95, 'Programming', 185, @RESULT);
CALL ADD_BOOK(5254, 'Coding Style for Maintenance', 2017, 49.95, 'Programming', 559, @RESULT);
CALL ADD_BOOK(5255, 'Coding Style for Java by Rik', 2023, 49.95, 'Programming', 559, @RESULT);


-- Call the ADD_AUTHOR_T0_BOOK procedure to add additional author to the book
CALL ADD_AUTHOR_T0_BOOK(5239, 460, @RESULT);
CALL ADD_AUTHOR_T0_BOOK(5239, 592, @RESULT);
CALL ADD_AUTHOR_T0_BOOK(5241,559, @RESULT);
CALL ADD_AUTHOR_T0_BOOK(5244,284, @RESULT);
CALL ADD_AUTHOR_T0_BOOK(5250,438, @RESULT);



