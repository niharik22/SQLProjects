# Library Management Project

## Overview

This Library Management System is a comprehensive MySQL-based application designed to manage various library operations efficiently. It encompasses a range of functionalities including management of books, authors, patrons, and lending activities, implemented through a well-designed database schema, robust functions, procedures, and automated triggers.

## Database Schema

The database schema is composed of several key tables:

- `Books`: Stores details about the books available in the library, like title, year published, and subject.
- `Authors`: Contains information about authors, including name and birth year.
- `Patrons`: Holds records of library members, including their type (e.g., student, faculty).
- `Checkouts`: Tracks book lending details, including checkout and return dates.
- `Writes`: Establishes a many-to-many relationship between `Books` and `Authors`.

## Functions

The system includes several MySQL functions to facilitate various operations:

- `AUTHOR_EXISTS`: Checks if an author exists based on the given ID. It helps in verifying the existence of an author before associating them with a book.
- `BOOK_EXISTS`: Similar to `AUTHOR_EXISTS`, this function checks for the existence of a book in the library.
- `CALCULATE_OPEN_FINE`: Calculates fines for overdue books based on the number of days late.
- `PATRON_EXISTS`: Verifies whether a patron is registered in the library.
- `BOOK_AVAILABLE`: Checks if a book is currently available for checkout.
- `Validate_Checkin`: Ensures that a book check-in operation is valid.
- `Calculate_Total_Fines`: Computes the total fines accumulated by a patron for all overdue books.
- `Author_Book_Count`: Returns the total number of books associated with a specific author.
- `Most_Popular_Book`: Identifies the book with the highest frequency of checkouts.
- `Patron_Book_History`: Provides a summary of all the books checked out by a patron.

## Procedures

The project includes procedures for handling specific library operations:

- `ADD_BOOK`: Adds a new book to the library, including details about its author.
- `ADD_AUTHOR_TO_BOOK`: Associates an additional author with an existing book.
- `Checkout_Book`: Manages the process of checking out a book to a patron.
- `Checkin_Book`: Handles the check-in of books and updates relevant records.
- `Remove_Book`: Deletes a book from the library, including its associations in the `Writes` table.
- `Update_Book_Details`: Allows for updating the information of a book, such as title or year published.
- `Register_Patron`: Registers a new patron in the library with validations on patron type.

## Triggers

Automated triggers in the system enhance data integrity and operational efficiency:

- **On Checkout**: Automatically reduces the number of available copies of a book when it is checked out.
- **On Checkin**: Increases the available copies when a book is returned.
- **Prevent Duplicate Checkout**: Ensures a book cannot be checked out multiple times before being returned.
- **Validate Book Copies**: Confirms that the book copy count does not fall below zero.

## Testing

The `main.sql` file includes various test scenarios to ensure the correct functioning of all procedures and functions. It covers a range of typical and edge-case scenarios to comprehensively test the system's capabilities.

## Conclusion

This Library Management System is a versatile tool for library administration, providing a robust and user-friendly way to manage library resources, patrons, and lending activities. It's particularly well-suited for libraries seeking to digitize and streamline their operations.