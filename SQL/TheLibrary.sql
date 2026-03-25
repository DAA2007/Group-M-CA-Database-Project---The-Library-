#The Library SQL Code by Faheem Hussain, Ben McEvoy and Denzel Abraham

# What tables will be needed (subject to change)
# Books (ID, Title, Genre, Author, Publisher, DateOfPublishing, IsBorrowed?)
# BorrowedBooks (ID, Title, DateOfBorrow, ReturnTime, IsOverdue?)
# AccountHolders (UserID, Fname, SignUpDate, )

# 1 - Reset Database + re-initialise it
DROP DATABASE IF EXISTS Library;

CREATE DATABASE Library;

USE Library;

# 2 - Create the neccessary tables
CREATE TABLE Books(
	BookID int(7) primary key,
    Title VARCHAR(50),
    Genre VARCHAR(25),
    Author VARCHAR(100),
    Publisher VARCHAR(35),
    DateOfPublishing int(6),
    IsBorrowed boolean
);

CREATE TABLE BorrowedBooks(
	BookID int(7) primary key,
    Title VARCHAR(50),
    DateBorrowed int(6),
    ReturnDate int(6),
    IsOverdue boolean
);

CREATE TABLE LibraryAccounts(
	UserID int(5),
	Fname VARCHAR(15),
	DateFormed int(6),
	borrowedBookID int(7)
);