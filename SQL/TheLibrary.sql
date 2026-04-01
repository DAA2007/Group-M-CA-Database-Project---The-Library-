#The Library SQL Code by Faheem Hussain, Ben McEvoy and Denzel Abraham

# What tables will be needed (subject to change)
# Books (ID, Title, Genre, Author, Publisher, DateOfPublishing, IsBorrowed?)
# BorrowedBooks (ID, Title, DateOfBorrow, ReturnTime, IsOverdue?)
# AccountHolders (UserID, Fname, Lname, SignUpDate, )

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
    IsBorrowed boolean,
    foreign key (BookID) references Borrows(BookID)
);

CREATE TABLE Borrows(
	BookID int(7) primary key,
    Title VARCHAR(50),
    DateBorrowed int(6),
    BorrowerID int(5),
    ReturnDate int(6),
    IsOverdue boolean,
    foreign key (BookID) references Books(BookID),
    foreign key (Title) references Books(Title)
);

CREATE TABLE AccountHolders(
	UserID int(5) primary key,
	Fname VARCHAR(15),
    Lname VARCHAR(15),
	SignUpDate int(6),
    Borrows int(5),
    foreign key (UserID) references Borrows(BorrowerID)
);

# 3 - adding the values to the books
#INSERT INTO Books VALUES (
#"1234567","DummyTitle","Comedy","Dummy","Dummy Productions","2000-01-01",Yes
#);

# 4 - Queries (12 ones required)
# Denzel's Queries
# Ben's Queries
# Faheem's Queries

# Messages
#Denzel: I am thinking that LibraryAccounts should be part of AccountHolders like sub-tables but I don't know, you guys decide. - 30/03/2026
#Denzel: Oh ya, should we add a Table called ReturnedBooks since we have BorrowedBooks? - 30/03/2026
#Ben: I figured we were gonna only need a borrowed books table. As returned books would be taken off of the borrowed table 01/04
#Ben: We need atleast 3 queries each using group by, aggregates and joins each. For the report we just show what tools we used and what errors we encountered. 01/04
#Denzel: Oooh, I see. I'll start working on my Queries by tomorrow. - 01/04