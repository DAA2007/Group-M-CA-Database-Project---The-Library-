#The Library SQL Code by Faheem Hussain, Ben McEvoy and Denzel Abraham

# What tables will be needed (subject to change)
# Books (ID, Title, Genre, Author, Publisher, DateOfPublishing, IsBorrowed?)
# Borrowed (ID, Title, DateOfBorrow, ReturnTime, IsOverdue?)
# AccountHolders (UserID, Fname, Lname, SignUpDate, )

# 1 - Reset Database + re-initialise it

#TO fix errors:
#So far so great. However, using foreign keys and references for both Books and AccountHolders gives an Error Code 1452:  Cannot add or update a child row: a foreign key constraint fails.
#(So for now I have them hashtagged until we can hopefully find a workaround)
#Other than that, code fully runs. Looking great so far. - Denzel 08/04

DROP DATABASE IF EXISTS Library;

CREATE DATABASE Library;

USE Library;

# 2 - Create the neccessary tables
CREATE TABLE Books(
	BookID int primary key,
    Title VARCHAR(50),
    Genre VARCHAR(25),
    Author VARCHAR(100),
    Publisher VARCHAR(35),
    DateOfPublishing date,
    IsBorrowed boolean
);

CREATE TABLE IF NOT EXISTS Borrowed(
	UserID int primary key,
    BookID int,
    Title VARCHAR(50),
    DateOfBorrow date,
    ReturnTime date,
    IsOverdue boolean,
    foreign key (BookID) references Books(BookID)
);

#Added ALTER TABLE to Books for Borrowed to be referenced [since Borrowed comes after Books and the code needs to recognise Borrowed' existence.]
#This sadly causes an error so I just hashtagged it for now.
#ALTER TABLE Borrowed MODIFY id INT;

CREATE TABLE AccountHolders(
	UserID int primary key,
	Fname VARCHAR(15),
    Lname VARCHAR(15),
	SignUpDate date,
    foreign key (UserID) references Borrowed(UserID)
);

# 3 - adding the values to the books
# Books Data
insert into Books(BookID, Title, Genre, Author, Publisher, DateOfPublishing, IsBorrowed)
values
	(1, 'Nineteen Eighty-Four','Non-Fiction','GeorgeOrwell','HachetteBookGroup','1949-06-08',false),
	(2, 'Pride and Prejudice','HistoricalFiction','JaneAusten','Simon&Schuster','1813-01-28',true),
	(3, 'To Kill a Mockingbird','Self-Help','HarperLee','Simon&Schuster','1960-07-11',false),
	(4, 'The Great Gatsby','Fiction','F.ScottFitzgerald','PenguinRandomHouse','1925-04-10',false),
	(5, 'The Catcher in the Rye','Romance','J.D.Salinger','HachetteBookGroup','1951-07-16',true),
	(6, 'Animal Farm','Mystery','GeorgeOrwell','PenguinRandomHouse','1945-08-17',true),
	(7, 'The Hobbit','ScienceFiction','J.R.R.Tolkien','MacmillanPublishers','1937-09-21',false),
	(8, 'Harry Potter and the Philosopher''s Stone','Romance','J.K.Rowling','HarperCollins','1997-06-26',true),
	(9, 'Harry Potter and the Chamber of Secrets','Thriller','J.K.Rowling','MacmillanPublishers','1998-07-02',true),
	(10, 'Harry Potter and the Prisoner of Azkaban','Fantasy','J.K.Rowling','PenguinRandomHouse','1999-07-08',true),
	(11, 'Harry Potter and the Goblet of Fire','Non-Fiction','J.K.Rowling','Simon&Schuster','2000-07-08',true),
	(12, 'Harry Potter and the Order of the Phoenix','Fiction','J.K.Rowling','Simon&Schuster','2003-06-21',false),
	(13, 'Harry Potter and the Half-Blood Prince','Biography','J.K.Rowling','PenguinRandomHouse','2005-07-16',true),
	(14, 'Harry Potter and the Deathly Hallows','Fantasy','J.K.Rowling','MacmillanPublishers','2007-07-21',true),
	(15, 'The Fellowship of the Ring','Thriller','J.R.R.Tolkien','HachetteBookGroup','1954-07-29',true),
	(16, 'The Two Towers','Biography','J.R.R.Tolkien','HachetteBookGroup','1954-11-11',true),
	(17, 'The Return of the King','Romance','J.R.R.Tolkien','HachetteBookGroup','1955-10-20',true),
	(18, 'The Da Vinci Code','ScienceFiction','DanBrown','Simon&Schuster','2003-03-18',false),
	(19, 'The Fault in Our Stars','Fiction','JohnGreen','HarperCollins','2012-01-10',true),
	(20, 'Gone Girl','Fiction','GillianFlynn','MacmillanPublishers','2012-06-05',true),
	(21, 'The Goldfinch','Fantasy','DonnaTartt','MacmillanPublishers','2013-10-22',true),
	(22, 'The Road','Romance','CormacMcCarthy','Simon&Schuster','2006-09-26',false),
	(23, 'A Game of Thrones','Mystery','GeorgeR.R.Martin','HarperCollins','1996-08-06',false),
	(24, 'The Girl on the Train','Romance','PaulaHawkins','Simon&Schuster','2015-01-13',true),
	(25, 'Life of Pi','Non-Fiction','YannMartel','HachetteBookGroup','2001-09-11',true),
	(26, 'The Kite Runner','HistoricalFiction','KhaledHosseini','Simon&Schuster','2003-05-29',true),
	(27, 'The Book Thief','Self-Help','MarkusZusak','HarperCollins','2005-03-14',true),
	(28, 'Memoirs of a Geisha','Romance','ArthurGolden','HachetteBookGroup','1997-09-27',false),
	(29, 'The Lovely Bones','Fantasy','AliceSebold','Simon&Schuster','2002-07-16',false),
	(30, 'All the Light We Cannot See','Fantasy','AnthonyDoerr','Simon&Schuster','2014-05-06',true),
	(31, 'Nineteen Eighty-Four','Mystery','GeorgeOrwell','Simon&Schuster','1949-06-08',true),
	(32, 'Pride and Prejudice','HistoricalFiction','JaneAusten','PenguinRandomHouse','1813-01-28',false),
	(33, 'To Kill a Mockingbird','Self-Help','HarperLee','HarperCollins','1960-07-11',true),
	(34, 'The Great Gatsby','HistoricalFiction','F.ScottFitzgerald','Simon&Schuster','1925-04-10',true),
	(35, 'The Catcher in the Rye','Thriller','J.D.Salinger','HachetteBookGroup','1951-07-16',true),
	(36, 'Animal Farm','HistoricalFiction','GeorgeOrwell','HachetteBookGroup','1945-08-17',false),
	(37, 'The Hobbit','ScienceFiction','J.R.R.Tolkien','Simon&Schuster','1937-09-21',false),
	(38, 'Harry Potter and the Philosopher''s Stone','Self-Help','J.K.Rowling','HarperCollins','1997-06-26',true),
	(39, 'Harry Potter and the Chamber of Secrets','Self-Help','J.K.Rowling','Simon&Schuster','1998-07-02',true),
	(40, 'Harry Potter and the Prisoner of Azkaban','Thriller','J.K.Rowling','Simon&Schuster','1999-07-08',false),
	(41, 'Harry Potter and the Goblet of Fire','Self-Help','J.K.Rowling','PenguinRandomHouse','2000-07-08',false),
	(42, 'Harry Potter and the Order of the Phoenix','Biography','J.K.Rowling','HachetteBookGroup','2003-06-21',false),
	(43, 'Harry Potter and the Half-Blood Prince','Non-Fiction','J.K.Rowling','HachetteBookGroup','2005-07-16',true),
	(44, 'Harry Potter and the Deathly Hallows','HistoricalFiction','J.K.Rowling','MacmillanPublishers','2007-07-21',false),
	(45, 'The Fellowship of the Ring','Non-Fiction','J.R.R.Tolkien','Simon&Schuster','1954-07-29',false),
	(46, 'The Two Towers','Self-Help','J.R.R.Tolkien','Simon&Schuster','1954-11-11',false),
	(47, 'The Return of the King','Mystery','J.R.R.Tolkien','HarperCollins','1955-10-20',true),
	(48, 'The Da Vinci Code','Self-Help','DanBrown','PenguinRandomHouse','2003-03-18',true),
	(49, 'The Fault in Our Stars','HistoricalFiction','JohnGreen','HachetteBookGroup','2012-01-10',true),
	(50, 'Gone Girl','ScienceFiction','GillianFlynn','PenguinRandomHouse','2012-06-05',false),
	(51, 'The Goldfinch','Fiction','DonnaTartt','MacmillanPublishers','2013-10-22',true),
	(52, 'The Road','Self-Help','CormacMcCarthy','MacmillanPublishers','2006-09-26',false),
	(53, 'A Game of Thrones','HistoricalFiction','GeorgeR.R.Martin','PenguinRandomHouse','1996-08-06',false),
	(54, 'The Girl on the Train','ScienceFiction','PaulaHawkins','HachetteBookGroup','2015-01-13',false),
	(55, 'Life of Pi','Thriller','YannMartel','PenguinRandomHouse','2001-09-11',false),
	(56, 'The Kite Runner','Biography','KhaledHosseini','HarperCollins','2003-05-29',true),
	(57, 'The Book Thief','Biography','MarkusZusak','PenguinRandomHouse','2005-03-14',false),
	(58, 'Memoirs of a Geisha','Fiction','ArthurGolden','PenguinRandomHouse','1997-09-27',false),
	(59, 'The Lovely Bones','Mystery','AliceSebold','Simon&Schuster','2002-07-16',false),
	(60, 'All the Light We Cannot See','Self-Help','AnthonyDoerr','MacmillanPublishers','2014-05-06',false),
	(61, 'Nineteen Eighty-Four','Mystery','GeorgeOrwell','HachetteBookGroup','1949-06-08',true),
	(62, 'Pride and Prejudice','ScienceFiction','JaneAusten','HachetteBookGroup','1813-01-28',false),
	(63, 'To Kill a Mockingbird','Romance','HarperLee','HachetteBookGroup','1960-07-11',true),
	(64, 'The Great Gatsby','Fantasy','F.ScottFitzgerald','HarperCollins','1925-04-10',false),
	(65, 'The Catcher in the Rye','Non-Fiction','J.D.Salinger','MacmillanPublishers','1951-07-16',false),
	(66, 'Animal Farm','Mystery','GeorgeOrwell','Simon&Schuster','1945-08-17',false),
	(67, 'The Hobbit','Fantasy','J.R.R.Tolkien','Simon&Schuster','1937-09-21',true),
	(68, 'Harry Potter and the Philosopher''s Stone','HistoricalFiction','J.K.Rowling','HachetteBookGroup','1997-06-26',false),
	(69, 'Harry Potter and the Chamber of Secrets','ScienceFiction','J.K.Rowling','PenguinRandomHouse','1998-07-02',true),
	(70, 'Harry Potter and the Prisoner of Azkaban','Fantasy','J.K.Rowling','PenguinRandomHouse','1999-07-08',false),
	(71, 'Harry Potter and the Goblet of Fire','Thriller','J.K.Rowling','PenguinRandomHouse','2000-07-08',false),
	(72, 'Harry Potter and the Order of the Phoenix','ScienceFiction','J.K.Rowling','HachetteBookGroup','2003-06-21',true),
	(73, 'Harry Potter and the Half-Blood Prince','Mystery','J.K.Rowling','HachetteBookGroup','2005-07-16',true),
	(74, 'Harry Potter and the Deathly Hallows','Mystery','J.K.Rowling','PenguinRandomHouse','2007-07-21',true),
	(75, 'The Fellowship of the Ring','ScienceFiction','J.R.R.Tolkien','MacmillanPublishers','1954-07-29',false),
	(76, 'The Two Towers','Self-Help','J.R.R.Tolkien','HachetteBookGroup','1954-11-11',true),
	(77, 'The Return of the King','Self-Help','J.R.R.Tolkien','HarperCollins','1955-10-20',false),
	(78, 'The Da Vinci Code','Non-Fiction','DanBrown','Simon&Schuster','2003-03-18',true),
	(79, 'The Fault in Our Stars','Mystery','JohnGreen','PenguinRandomHouse','2012-01-10',true),
	(80, 'Gone Girl','Biography','GillianFlynn','MacmillanPublishers','2012-06-05',false),
	(81, 'The Goldfinch','Thriller','DonnaTartt','HarperCollins','2013-10-22',true),
	(82, 'The Road','Non-Fiction','CormacMcCarthy','HachetteBookGroup','2006-09-26',true),
	(83, 'A Game of Thrones','Non-Fiction','GeorgeR.R.Martin','PenguinRandomHouse','1996-08-06',false),
	(84, 'The Girl on the Train','Romance','PaulaHawkins','Simon&Schuster','2015-01-13',true),
	(85, 'Life of Pi','Self-Help','YannMartel','HachetteBookGroup','2001-09-11',false),
	(86, 'The Kite Runner','Self-Help','KhaledHosseini','Simon&Schuster','2003-05-29',true),
	(87, 'The Book Thief','Self-Help','MarkusZusak','Simon&Schuster','2005-03-14',false),
	(88, 'Memoirs of a Geisha','ScienceFiction','ArthurGolden','MacmillanPublishers','1997-09-27',true),
	(89, 'The Lovely Bones','Biography','AliceSebold','HarperCollins','2002-07-16',false),
	(90, 'All the Light We Cannot See','ScienceFiction','AnthonyDoerr','HarperCollins','2014-05-06',false),
	(91, 'Nineteen Eighty-Four','Romance','GeorgeOrwell','HarperCollins','1949-06-08',true),
	(92, 'Pride and Prejudice','Romance','JaneAusten','MacmillanPublishers','1813-01-28',false),
	(93, 'To Kill a Mockingbird','Thriller','HarperLee','PenguinRandomHouse','1960-07-11',true),
	(94, 'The Great Gatsby','Non-Fiction','F.ScottFitzgerald','HachetteBookGroup','1925-04-10',false),
	(95, 'The Catcher in the Rye','Non-Fiction','J.D.Salinger','HachetteBookGroup','1951-07-16',false),
	(96, 'Animal Farm','Fiction','GeorgeOrwell','Simon&Schuster','1945-08-17',false),
	(97, 'The Hobbit','Biography','J.R.R.Tolkien','HachetteBookGroup','1937-09-21',true),
	(98, 'Harry Potter and the Philosopher''s Stone','Romance','J.K.Rowling','PenguinRandomHouse','1997-06-26',false),
	(99, 'Harry Potter and the Chamber of Secrets','Romance','J.K.Rowling','Simon&Schuster','1998-07-02',false),
	(100, 'Harry Potter and the Prisoner of Azkaban','Fiction','J.K.Rowling','PenguinRandomHouse','1999-07-08',true),
	(101, 'Harry Potter and the Goblet of Fire','HistoricalFiction','J.K.Rowling','Simon&Schuster','2000-07-08',true),
	(102, 'Harry Potter and the Order of the Phoenix','Non-Fiction','J.K.Rowling','HarperCollins','2003-06-21',false),
	(103, 'Harry Potter and the Half-Blood Prince','Fantasy','J.K.Rowling','Simon&Schuster','2005-07-16',true),
	(104, 'Harry Potter and the Deathly Hallows','Self-Help','J.K.Rowling','Simon&Schuster','2007-07-21',true),
	(105, 'The Fellowship of the Ring','Biography','J.R.R.Tolkien','Simon&Schuster','1954-07-29',true),
	(106, 'The Two Towers','Thriller','J.R.R.Tolkien','Simon&Schuster','1954-11-11',false),
	(107, 'The Return of the King','Biography','J.R.R.Tolkien','HarperCollins','1955-10-20',true),
	(108, 'The Da Vinci Code','Fantasy','DanBrown','HarperCollins','2003-03-18',true),
	(109, 'The Fault in Our Stars','Fiction','JohnGreen','MacmillanPublishers','2012-01-10',true),
	(110, 'Gone Girl','HistoricalFiction','GillianFlynn','PenguinRandomHouse','2012-06-05',true),
	(111, 'The Goldfinch','Fantasy','DonnaTartt','HarperCollins','2013-10-22',true),
	(112, 'The Road','Biography','CormacMcCarthy','HachetteBookGroup','2006-09-26',true),
	(113, 'A Game of Thrones','Biography','GeorgeR.R.Martin','HachetteBookGroup','1996-08-06',false),
	(114, 'The Girl on the Train','Mystery','PaulaHawkins','HachetteBookGroup','2015-01-13',true),
	(115, 'Life of Pi','Fiction','YannMartel','HarperCollins','2001-09-11',false),
	(116, 'The Kite Runner','Romance','KhaledHosseini','PenguinRandomHouse','2003-05-29',true),
	(117, 'The Book Thief','Romance','MarkusZusak','Simon&Schuster','2005-03-14',false),
	(118, 'Memoirs of a Geisha','ScienceFiction','ArthurGolden','HachetteBookGroup','1997-09-27',false),
	(119, 'The Lovely Bones','Mystery','AliceSebold','HarperCollins','2002-07-16',false),
	(120, 'All the Light We Cannot See','ScienceFiction','AnthonyDoerr','HachetteBookGroup','2014-05-06',false),
	(121, 'Nineteen Eighty-Four','Self-Help','GeorgeOrwell','PenguinRandomHouse','1949-06-08',true),
	(122, 'Pride and Prejudice','Biography','JaneAusten','MacmillanPublishers','1813-01-28',true),
	(123, 'To Kill a Mockingbird','Fiction','HarperLee','HarperCollins','1960-07-11',true),
	(124, 'The Great Gatsby','Romance','F.ScottFitzgerald','HarperCollins','1925-04-10',false),
	(125, 'The Catcher in the Rye','Biography','J.D.Salinger','MacmillanPublishers','1951-07-16',false),
	(126, 'Animal Farm','Fantasy','GeorgeOrwell','HarperCollins','1945-08-17',true),
	(127, 'The Hobbit','Self-Help','J.R.R.Tolkien','MacmillanPublishers','1937-09-21',true),
	(128, 'Harry Potter and the Philosopher''s Stone','ScienceFiction','J.K.Rowling','Simon&Schuster','1997-06-26',true),
	(129, 'Harry Potter and the Chamber of Secrets','HistoricalFiction','J.K.Rowling','Simon&Schuster','1998-07-02',false),
	(130, 'Harry Potter and the Prisoner of Azkaban','Romance','J.K.Rowling','Simon&Schuster','1999-07-08',true),
	(131, 'Harry Potter and the Goblet of Fire','Biography','J.K.Rowling','MacmillanPublishers','2000-07-08',false),
	(132, 'Harry Potter and the Order of the Phoenix','Romance','J.K.Rowling','MacmillanPublishers','2003-06-21',false),
	(133, 'Harry Potter and the Half-Blood Prince','Mystery','J.K.Rowling','MacmillanPublishers','2005-07-16',false),
	(134, 'Harry Potter and the Deathly Hallows','Fiction','J.K.Rowling','HachetteBookGroup','2007-07-21',true),
	(135, 'The Fellowship of the Ring','Mystery','J.R.R.Tolkien','MacmillanPublishers','1954-07-29',false),
	(136, 'The Two Towers','Mystery','J.R.R.Tolkien','PenguinRandomHouse','1954-11-11',false),
	(137, 'The Return of the King','ScienceFiction','J.R.R.Tolkien','HarperCollins','1955-10-20',true),
	(138, 'The Da Vinci Code','ScienceFiction','DanBrown','HarperCollins','2003-03-18',false),
	(139, 'The Fault in Our Stars','HistoricalFiction','JohnGreen','Simon&Schuster','2012-01-10',false),
	(140, 'Gone Girl','Fiction','GillianFlynn','HarperCollins','2012-06-05',false),
	(141, 'The Goldfinch','ScienceFiction','DonnaTartt','MacmillanPublishers','2013-10-22',false),
	(142, 'The Road','Thriller','CormacMcCarthy','PenguinRandomHouse','2006-09-26',true),
	(143, 'A Game of Thrones','Self-Help','GeorgeR.R.Martin','PenguinRandomHouse','1996-08-06',false),
	(144, 'The Girl on the Train','Mystery','PaulaHawkins','HarperCollins','2015-01-13',false),
	(145, 'Life of Pi','Fiction','YannMartel','HarperCollins','2001-09-11',false),
	(146, 'The Kite Runner','Fantasy','KhaledHosseini','MacmillanPublishers','2003-05-29',true),
	(147, 'The Book Thief','Non-Fiction','MarkusZusak','Simon&Schuster','2005-03-14',true),
	(148, 'Memoirs of a Geisha','Self-Help','ArthurGolden','MacmillanPublishers','1997-09-27',false),
	(149, 'The Lovely Bones','Mystery','AliceSebold','Simon&Schuster','2002-07-16',true),
	(150, 'All the Light We Cannot See','Biography','AnthonyDoerr','HarperCollins','2014-05-06',true);

# Borrowed data
# Borrowed (ID, Title, DateOfBorrow, ReturnTime, IsOverdue?)
insert into Borrowed(BookID, Title, DateOfBorrow, ReturnTime, UserID, IsOverdue)
#Same thing here
values
	(1, 'Nineteen Eighty-Four', '2026-01-05', '2026-01-19', 1, true),
	(2, 'Pride and Prejudice', '2026-01-06', '2026-01-20', 2, true),
	(3, 'To Kill a Mockingbird', '2026-01-07', '2026-01-21', 3, true),
	(4, 'The Great Gatsby', '2026-01-08', '2026-01-22', 4, true),
	(5, 'The Catcher in the Rye', '2026-01-09', '2026-01-23', 5, true),
	(6, 'Animal Farm', '2026-01-10', '2026-01-24', 6, true),
	(7, 'The Hobbit', '2026-01-11', '2026-01-25', 7, true),
	(8, 'Harry Potter and the Philosopher''s Stone', '2026-01-12', '2026-01-26', 8, true),
	(9, 'Harry Potter and the Chamber of Secrets', '2026-01-13', '2026-01-27', 9, true),
	(10, 'Harry Potter and the Prisoner of Azkaban', '2026-01-14', '2026-01-28', 10, true),
	(11, 'Harry Potter and the Goblet of Fire', '2026-01-15', '2026-01-29', 11, true),
	(12, 'Harry Potter and the Order of the Phoenix', '2026-01-16', '2026-01-30', 12, true),
	(13, 'Harry Potter and the Half-Blood Prince', '2026-01-17', '2026-01-31', 13, true),
	(14, 'Harry Potter and the Deathly Hallows', '2026-01-18', '2026-02-01', 14, true),
	(15, 'The Fellowship of the Ring', '2026-01-19', '2026-02-02', 15, true),
	(16, 'The Two Towers', '2026-01-20', '2026-02-03', 16, true),
	(17, 'The Return of the King', '2026-01-21', '2026-02-04', 17, true),
	(18, 'The Da Vinci Code', '2026-01-22', '2026-02-05', 18, true),
	(19, 'The Fault in Our Stars', '2026-01-23', '2026-02-06', 19, true),
	(20, 'Gone Girl', '2026-01-24', '2026-02-07', 20, true),
	(21, 'The Goldfinch', '2026-01-25', '2026-02-08', 21, true),
	(22, 'The Road', '2026-01-26', '2026-02-09', 22, true),
	(23, 'A Game of Thrones', '2026-01-27', '2026-02-10', 23, true),
	(24, 'The Girl on the Train', '2026-01-28', '2026-02-11', 24, true),
	(25, 'Life of Pi', '2026-01-29', '2026-02-12', 25, true),
	(26, 'The Kite Runner', '2026-01-30', '2026-02-13', 26, true),
	(27, 'The Book Thief', '2026-01-31', '2026-02-14', 27, true),
	(28, 'Memoirs of a Geisha', '2026-02-01', '2026-02-15', 28, true),
	(29, 'The Lovely Bones', '2026-02-02', '2026-02-16', 29, true),
	(30, 'All the Light We Cannot See', '2026-02-03', '2026-02-17', 30, true),
	(31, 'Nineteen Eighty-Four', '2026-02-04', '2026-02-18', 31, true),
	(32, 'Pride and Prejudice', '2026-02-05', '2026-02-19', 32, true),
	(33, 'To Kill a Mockingbird', '2026-02-06', '2026-02-20', 33, true),
	(34, 'The Great Gatsby', '2026-02-07', '2026-02-21', 34, true),
	(35, 'The Catcher in the Rye', '2026-02-08', '2026-02-22', 35, true),
	(36, 'Animal Farm', '2026-02-09', '2026-02-23', 36, true),
	(37, 'The Hobbit', '2026-02-10', '2026-02-24', 37, true),
	(38, 'Harry Potter and the Philosopher''s Stone', '2026-02-11', '2026-02-25', 38, true),
	(39, 'Harry Potter and the Chamber of Secrets', '2026-02-12', '2026-02-26', 39, true),
	(40, 'Harry Potter and the Prisoner of Azkaban', '2026-02-13', '2026-02-27', 40, true),
	(41, 'Harry Potter and the Goblet of Fire', '2026-02-14', '2026-02-28', 41, true),
	(42, 'Harry Potter and the Order of the Phoenix', '2026-02-15', '2026-03-01', 42, true),
	(43, 'Harry Potter and the Half-Blood Prince', '2026-02-16', '2026-03-02', 43, true),
	(44, 'Harry Potter and the Deathly Hallows', '2026-02-17', '2026-03-03', 44, true),
	(45, 'The Fellowship of the Ring', '2026-02-18', '2026-03-04', 45, true),
	(46, 'The Two Towers', '2026-02-19', '2026-03-05', 46, true),
	(47, 'The Return of the King', '2026-02-20', '2026-03-06', 47, true),
	(48, 'The Da Vinci Code', '2026-02-21', '2026-03-07', 48, true),
	(49, 'The Fault in Our Stars', '2026-02-22', '2026-03-08', 49, true),
	(50, 'Gone Girl', '2026-02-23', '2026-03-09', 50, true),
	(51, 'The Goldfinch', '2026-02-24', '2026-03-10', 51, true),
	(52, 'The Road', '2026-02-25', '2026-03-11', 52, true),
	(53, 'A Game of Thrones', '2026-02-26', '2026-03-12', 53, true),
	(54, 'The Girl on the Train', '2026-02-27', '2026-03-13', 54, true),
	(55, 'Life of Pi', '2026-02-28', '2026-03-14', 55, true),
	(56, 'The Kite Runner', '2026-03-01', '2026-03-15', 56, true),
	(57, 'The Book Thief', '2026-03-02', '2026-03-16', 57, true),
	(58, 'Memoirs of a Geisha', '2026-03-03', '2026-03-17', 58, true),
	(59, 'The Lovely Bones', '2026-03-04', '2026-03-18', 59, true),
	(60, 'All the Light We Cannot See', '2026-03-05', '2026-03-19', 60, true),
	(61, 'Nineteen Eighty-Four', '2026-03-06', '2026-03-20', 61, true),
	(62, 'Pride and Prejudice', '2026-03-07', '2026-03-21', 62, true),
	(63, 'To Kill a Mockingbird', '2026-03-08', '2026-03-22', 63, true),
	(64, 'The Great Gatsby', '2026-03-09', '2026-03-23', 64, true),
	(65, 'The Catcher in the Rye', '2026-03-10', '2026-03-24', 65, true),
	(66, 'Animal Farm', '2026-03-11', '2026-03-25', 66, true),
	(67, 'The Hobbit', '2026-03-12', '2026-03-26', 67, true),
	(68, 'Harry Potter and the Philosopher''s Stone', '2026-03-13', '2026-03-27', 68, true),
	(69, 'Harry Potter and the Chamber of Secrets', '2026-03-14', '2026-03-28', 69, true),
	(70, 'Harry Potter and the Prisoner of Azkaban', '2026-03-15', '2026-03-29', 70, true),
	(71, 'Harry Potter and the Goblet of Fire', '2026-03-16', '2026-03-30', 71, true),
	(72, 'Harry Potter and the Order of the Phoenix', '2026-03-17', '2026-03-31', 72, true),
	(73, 'Harry Potter and the Half-Blood Prince', '2026-03-18', '2026-04-01', 73, true),
	(74, 'Harry Potter and the Deathly Hallows', '2026-03-19', '2026-04-02', 74, false),
	(75, 'The Fellowship of the Ring', '2026-03-20', '2026-04-03', 75, false),
	(76, 'The Two Towers', '2026-03-21', '2026-04-04', 76, false),
	(77, 'The Return of the King', '2026-03-22', '2026-04-05', 77, false),
	(78, 'The Da Vinci Code', '2026-03-23', '2026-04-06', 78, false),
	(79, 'The Fault in Our Stars', '2026-03-24', '2026-04-07', 79, false),
	(80, 'Gone Girl', '2026-03-25', '2026-04-08', 80, false),
	(81, 'The Goldfinch', '2026-03-26', '2026-04-09', 81, false),
	(82, 'The Road', '2026-03-27', '2026-04-10', 82, false),
	(83, 'A Game of Thrones', '2026-03-28', '2026-04-11', 83, false),
	(84, 'The Girl on the Train', '2026-03-29', '2026-04-12', 84, false),
	(85, 'Life of Pi', '2026-03-30', '2026-04-13', 85, false),
	(86, 'The Kite Runner', '2026-03-31', '2026-04-14', 86, false),
	(87, 'The Book Thief', '2026-04-01', '2026-04-15', 87, false),
	(88, 'Memoirs of a Geisha', '2026-04-02', '2026-04-16', 88, false),
	(89, 'The Lovely Bones', '2026-04-03', '2026-04-17', 89, false),
	(90, 'All the Light We Cannot See', '2026-04-04', '2026-04-18', 90, false),
	(91, 'Nineteen Eighty-Four', '2026-04-05', '2026-04-19', 91, false),
	(92, 'Pride and Prejudice', '2026-04-06', '2026-04-20', 92, false),
	(93, 'To Kill a Mockingbird', '2026-04-07', '2026-04-21', 93, false),
	(94, 'The Great Gatsby', '2026-04-08', '2026-04-22', 94, false),
	(95, 'The Catcher in the Rye', '2026-04-09', '2026-04-23', 95, false),
	(96, 'Animal Farm', '2026-04-10', '2026-04-24', 96, false),
	(97, 'The Hobbit', '2026-04-11', '2026-04-25', 97, false),
	(98, 'Harry Potter and the Philosopher''s Stone', '2026-04-12', '2026-04-26', 98, false),
	(99, 'Harry Potter and the Chamber of Secrets', '2026-04-13', '2026-04-27', 99, false),
	(100, 'Harry Potter and the Prisoner of Azkaban', '2026-04-14', '2026-04-28', 100, false),
	(101, 'Harry Potter and the Goblet of Fire', '2026-04-15', '2026-04-29', 101, false),
	(102, 'Harry Potter and the Order of the Phoenix', '2026-04-16', '2026-04-30', 102, false),
	(103, 'Harry Potter and the Half-Blood Prince', '2026-04-17', '2026-05-01', 103, false),
	(104, 'Harry Potter and the Deathly Hallows', '2026-04-18', '2026-05-02', 104, false),
	(105, 'The Fellowship of the Ring', '2026-04-19', '2026-05-03', 105, false),
	(106, 'The Two Towers', '2026-04-20', '2026-05-04', 106, false),
	(107, 'The Return of the King', '2026-04-21', '2026-05-05', 107, false),
	(108, 'The Da Vinci Code', '2026-04-22', '2026-05-06', 108, false),
	(109, 'The Fault in Our Stars', '2026-04-23', '2026-05-07', 109, false),
	(110, 'Gone Girl', '2026-04-24', '2026-05-08', 110, false),
	(111, 'The Goldfinch', '2026-04-25', '2026-05-09', 111, false),
	(112, 'The Road', '2026-04-26', '2026-05-10', 112, false),
	(113, 'A Game of Thrones', '2026-04-27', '2026-05-11', 113, false),
	(114, 'The Girl on the Train', '2026-04-28', '2026-05-12', 114, false),
	(115, 'Life of Pi', '2026-04-29', '2026-05-13', 115, false),
	(116, 'The Kite Runner', '2026-04-30', '2026-05-14', 116, false),
	(117, 'The Book Thief', '2026-05-01', '2026-05-15', 117, false),
	(118, 'Memoirs of a Geisha', '2026-05-02', '2026-05-16', 118, false),
	(119, 'The Lovely Bones', '2026-05-03', '2026-05-17', 119, false),
	(120, 'All the Light We Cannot See', '2026-05-04', '2026-05-18', 120, false),
	(121, 'Nineteen Eighty-Four', '2026-05-05', '2026-05-19', 121, false),
	(122, 'Pride and Prejudice', '2026-05-06', '2026-05-20', 122, false),
	(123, 'To Kill a Mockingbird', '2026-05-07', '2026-05-21', 123, false),
	(124, 'The Great Gatsby', '2026-05-08', '2026-05-22', 124, false),
	(125, 'The Catcher in the Rye', '2026-05-09', '2026-05-23', 125, false),
	(126, 'Animal Farm', '2026-05-10', '2026-05-24', 126, false),
	(127, 'The Hobbit', '2026-05-11', '2026-05-25', 127, false),
	(128, 'Harry Potter and the Philosopher''s Stone', '2026-05-12', '2026-05-26', 128, false),
	(129, 'Harry Potter and the Chamber of Secrets', '2026-05-13', '2026-05-27', 129, false),
	(130, 'Harry Potter and the Prisoner of Azkaban', '2026-05-14', '2026-05-28', 130, false),
	(131, 'Harry Potter and the Goblet of Fire', '2026-05-15', '2026-05-29', 131, false),
	(132, 'Harry Potter and the Order of the Phoenix', '2026-05-16', '2026-05-30', 132, false),
	(133, 'Harry Potter and the Half-Blood Prince', '2026-05-17', '2026-05-31', 133, false),
	(134, 'Harry Potter and the Deathly Hallows', '2026-05-18', '2026-06-01', 134, false),
	(135, 'The Fellowship of the Ring', '2026-05-19', '2026-06-02', 135, false),
	(136, 'The Two Towers', '2026-05-20', '2026-06-03', 136, false),
	(137, 'The Return of the King', '2026-05-21', '2026-06-04', 137, false),
	(138, 'The Da Vinci Code', '2026-05-22', '2026-06-05', 138, false),
	(139, 'The Fault in Our Stars', '2026-05-23', '2026-06-06', 139, false),
	(140, 'Gone Girl', '2026-05-24', '2026-06-07', 140, false),
	(141, 'The Goldfinch', '2026-05-25', '2026-06-08', 141, false),
	(142, 'The Road', '2026-05-26', '2026-06-09', 142, false),
	(143, 'A Game of Thrones', '2026-05-27', '2026-06-10', 143, false),
	(144, 'The Girl on the Train', '2026-05-28', '2026-06-11', 144, false),
	(145, 'Life of Pi', '2026-05-29', '2026-06-12', 145, false),
	(146, 'The Kite Runner', '2026-05-30', '2026-06-13', 146, false),
	(147, 'The Book Thief', '2026-05-31', '2026-06-14', 147, false),
	(148, 'Memoirs of a Geisha', '2026-06-01', '2026-06-15', 148, false),
	(149, 'The Lovely Bones', '2026-06-02', '2026-06-16', 149, false),
	(150, 'All the Light We Cannot See', '2026-06-03', '2026-06-17', 150, false);

# AccountHolders Data
# AccountHolders (UserID, Fname, Lname, SignUpDate) - Just like BookID, you can do this too alternatively but I just went with an simplier way
insert into AccountHolders(UserID, Fname, Lname, SignUpDate) 
values
	(1, 'Giustina', 'Rings', '2024-02-12'),
	(2, 'Wynny', 'Hailston', '2020-07-21'),
	(3, 'Nancy', 'Bondar', '2020-07-02'),
	(4, 'Kenny', 'Henze', '2023-07-18'),
	(5, 'Carlene', 'Rawes', '2021-09-15'),
	(6, 'Curr', 'Rocco', '2024-03-22'),
	(7, 'Armin', 'McDuffy', '2023-06-27'),
	(8, 'Dmitri', 'Keattch', '2020-02-17'),
	(9, 'Gerik', 'Bulter', '2023-10-04'),
	(10, 'Dwayne', 'Fitzsimmons', '2023-01-01'),
	(11, 'Even', 'Oleksinski', '2022-01-19'),
	(12, 'Dore', 'Segges', '2022-09-01'),
	(13, 'Eba', 'McNerlin', '2020-03-11'),
	(14, 'Marylee', 'Tubbles', '2024-08-23'),
	(15, 'Launce', 'Syred', '2022-12-17'),
	(16, 'Ermengarde', 'Markwelley', '2024-01-19'),
	(17, 'Dimitry', 'Jackways', '2020-04-17'),
	(18, 'Hilarius', 'Reymers', '2020-09-08'),
	(19, 'Scarface', 'Gogarty', '2024-07-22'),
	(20, 'Birgitta', 'Seppey', '2022-03-31'),
	(21, 'Salvidor', 'Merrgan', '2021-01-01'),
	(22, 'Tedra', 'Brixey', '2021-12-11'),
	(23, 'Fancy', 'Hearnshaw', '2020-01-07'),
	(24, 'Layton', 'Hadenton', '2023-12-19'),
	(25, 'Ag', 'Lomb', '2022-08-07'),
	(26, 'Elise', 'Calwell', '2025-08-12'),
	(27, 'Holly', 'Melchior', '2024-10-01'),
	(28, 'Bastien', 'O''Farrell', '2020-12-04'),
	(29, 'Carny', 'Possek', '2021-08-02'),
	(30, 'Aigneis', 'Moutray Read', '2024-07-16'),
	(31, 'Brew', 'Corah', '2022-03-20'),
	(32, 'Rycca', 'Moverley', '2020-03-02'),
	(33, 'Rupert', 'Antonucci', '2021-02-09'),
	(34, 'Pansy', 'Plascott', '2023-12-10'),
	(35, 'Laird', 'Koopman', '2025-12-30'),
	(36, 'Bryant', 'Guillem', '2021-01-09'),
	(37, 'Tuesday', 'Labbet', '2020-11-10'),
	(38, 'Mata', 'Crowe', '2025-11-10'),
	(39, 'Jonie', 'Wattinham', '2020-06-27'),
	(40, 'Bili', 'Cawley', '2020-10-31'),
	(41, 'Shanie', 'Tampion', '2020-10-21'),
	(42, 'Al', 'Renac', '2024-12-20'),
	(43, 'Rafe', 'Swayte', '2020-11-29'),
	(44, 'Rozella', 'Simonot', '2020-09-19'),
	(45, 'Lynnett', 'Duffield', '2024-07-01'),
	(46, 'Freedman', 'Sinkinson', '2021-07-24'),
	(47, 'Bradly', 'Scotchbrook', '2023-07-25'),
	(48, 'Tabbie', 'Swallwell', '2022-12-11'),
	(49, 'Trip', 'Bugden', '2021-11-28'),
	(50, 'Burtie', 'Brockherst', '2025-01-08'),
	(51, 'Tan', 'Meeson', '2020-01-24'),
	(52, 'Rowney', 'Hundal', '2021-11-05'),
	(53, 'Gawain', 'Huxter', '2022-06-01'),
	(54, 'Harold', 'Buret', '2024-10-20'),
	(55, 'Keelby', 'Boorne', '2020-08-28'),
	(56, 'Morty', 'Pleager', '2024-08-30'),
	(57, 'Florencia', 'Dives', '2022-02-28'),
	(58, 'Reggie', 'Tinklin', '2020-02-07'),
	(59, 'Noell', 'Trewin', '2025-11-17'),
	(60, 'Candra', 'Eldin', '2020-08-05'),
	(61, 'Flor', 'Folder', '2023-12-15'),
	(62, 'Basile', 'Moralee', '2021-08-11'),
	(63, 'Karyl', 'Hargate', '2025-11-14'),
	(64, 'Ralph', 'Cabrales', '2024-05-31'),
	(65, 'Wrennie', 'Assur', '2024-01-25'),
	(66, 'Esdras', 'Sellens', '2023-09-04'),
	(67, 'Winifred', 'Eyckelberg', '2020-06-25'),
	(68, 'Skip', 'Kleinsinger', '2024-10-23'),
	(69, 'Bobbi', 'Treker', '2021-01-21'),
	(70, 'Britney', 'Barclay', '2021-01-11'),
	(71, 'Alvera', 'Rapper', '2022-08-07'),
	(72, 'Jazmin', 'Lodewick', '2023-04-25'),
	(73, 'Jaye', 'Wareing', '2024-12-23'),
	(74, 'Carlie', 'Deek', '2021-06-19'),
	(75, 'Sib', 'Godspede', '2021-12-24'),
	(76, 'Frances', 'Everly', '2020-01-25'),
	(77, 'Pennie', 'De Few', '2023-05-25'),
	(78, 'Selina', 'O''Halleghane', '2020-09-27'),
	(79, 'Con', 'Ridel', '2025-07-13'),
	(80, 'Chlo', 'Gonzalo', '2022-06-09'),
	(81, 'Esther', 'Gunson', '2022-12-02'),
	(82, 'Van', 'Hawkeridge', '2023-08-14'),
	(83, 'Verile', 'Bedding', '2025-10-08'),
	(84, 'Willette', 'Grishanov', '2023-08-25'),
	(85, 'Emery', 'Gibard', '2020-02-26'),
	(86, 'Putnam', 'Mauro', '2022-06-03'),
	(87, 'Fionna', 'Labdon', '2023-02-10'),
	(88, 'Mead', 'Sebring', '2024-05-04'),
	(89, 'Merrel', 'Drews', '2020-05-06'),
	(90, 'Jeannine', 'Fearnyhough', '2020-10-05'),
	(91, 'Hatty', 'Lockton', '2023-02-21'),
	(92, 'Ivy', 'Tiery', '2024-10-27'),
	(93, 'Olvan', 'Mellings', '2022-06-22'),
	(94, 'Hercules', 'Colomb', '2021-04-03'),
	(95, 'Jeffy', 'Sanches', '2020-04-16'),
	(96, 'Sybilla', 'Tinline', '2025-04-24'),
	(97, 'Clementina', 'Jonathon', '2024-11-03'),
	(98, 'Antonie', 'Mum', '2025-12-22'),
	(99, 'Gordan', 'Lanfear', '2023-04-18'),
	(100, 'Mitchael', 'Follen', '2021-11-04'),
	(101, 'Patric', 'Delnevo', '2021-06-06'),
	(102, 'Jard', 'Floris', '2024-12-23'),
	(103, 'Burlie', 'Robbert', '2020-09-20'),
	(104, 'Elinor', 'Brookfield', '2025-03-04'),
	(105, 'Josi', 'Lavender', '2020-11-13'),
	(106, 'Alla', 'Ellingford', '2024-10-27'),
	(107, 'Ezekiel', 'Dovidaitis', '2020-12-17'),
	(108, 'Donnajean', 'Hadingham', '2023-12-21'),
	(109, 'Margaretha', 'Powter', '2021-02-24'),
	(110, 'Leena', 'Baggett', '2020-06-03'),
	(111, 'Kip', 'Hasson', '2024-01-03'),
	(112, 'Alexia', 'Vellden', '2020-10-12'),
	(113, 'Calida', 'Bollam', '2021-03-10'),
	(114, 'Alvis', 'Glavis', '2021-01-11'),
	(115, 'Blayne', 'Artz', '2024-05-06'),
	(116, 'Julius', 'Frears', '2024-08-17'),
	(117, 'Joan', 'Botwright', '2025-08-19'),
	(118, 'Jeno', 'Bedwell', '2025-11-11'),
	(119, 'Rockwell', 'Shardlow', '2024-04-08'),
	(120, 'Dalis', 'Duckit', '2024-04-15'),
	(121, 'Sunny', 'Pratt', '2021-11-11'),
	(122, 'Bathsheba', 'Lamzed', '2025-06-05'),
	(123, 'Benjy', 'Gidley', '2021-12-02'),
	(124, 'Adelice', 'Plaschke', '2023-02-11'),
	(125, 'Ede', 'Pinock', '2025-07-08'),
	(126, 'Barbette', 'Purkiss', '2024-06-23'),
	(127, 'Fredericka', 'Le Port', '2023-04-16'),
	(128, 'Nevil', 'Simeon', '2025-05-03'),
	(129, 'Amandy', 'Beller', '2022-01-22'),
	(130, 'Flin', 'Dreamer', '2025-11-02'),
	(131, 'Mordecai', 'Krzysztof', '2022-04-22'),
	(132, 'Inna', 'Gildersleeve', '2020-03-04'),
	(133, 'Robers', 'Belhome', '2023-10-12'),
	(134, 'Lonna', 'Holde', '2024-04-10'),
	(135, 'Robin', 'Snuggs', '2022-04-21'),
	(136, 'Arvin', 'Josipovitz', '2025-09-09'),
	(137, 'Orton', 'Mason', '2024-04-12'),
	(138, 'Lutero', 'Cuppitt', '2024-12-04'),
	(139, 'Hatti', 'Searjeant', '2023-07-18'),
	(140, 'Reggy', 'Durant', '2022-01-26'),
	(141, 'Kristel', 'Castagneri', '2021-06-06'),
	(142, 'Heinrik', 'Pullan', '2023-01-28'),
	(143, 'Mia', 'Bouzek', '2023-11-21'),
	(144, 'Tera', 'Cobleigh', '2023-03-21'),
	(145, 'Vance', 'Meric', '2022-06-27'),
	(146, 'Melisande', 'Hudd', '2024-05-21'),
	(147, 'Andy', 'Baff', '2020-04-09'),
	(148, 'Filide', 'Nathon', '2022-10-22'),
	(149, 'Winfred', 'Saket', '2020-08-05'),
	(150, 'Danila', 'Fosdick', '2024-03-28');

	show tables;
# 4 - Queries (12 ones required)
# Denzel's Queries
#notes: GROUP BY, Aggregates: COUNT, SUM, AVG, MIN/MAX, Joins each: Inner Joins [JOIN, ON], Outer Joins, Left Joins, Right Joins, SELECT, FROM
#Query 1 - Here I will select how many total AccountHolders are there and how much of them haven't borrowed any books
select Count(*) as TotalAccountHolders, sum(IsOverdue) as TotalOfBooksNotBorrowed
from Borrowed;
#Query 2 - Let's see what year each book came out
select YEAR(DateOfPublishing) as YearPublished, Count(*) as BookNumPublished
from Books
Group by YearPublished order by YearPublished desc;
#Query 3 - The genre that has the most amount of books borrowed
select Genre as Genre, sum(IsBorrowed) as TotalAmountofBooksBorrowed
from Books
Group by Genre order by TotalAmountofBooksBorrowed desc;
#Query 4 - How many books each authors have
select Author as Author, count(*) as TotalAmountofBooks
from Books
Group by Author order by TotalAmountofBooks desc;

# Ben's Queries
# Query One - Finding the Number of Books borrowed
select Count(*) as TotalBooks, sum(IsBorrowed) as CurrentBorrowed from Books;

# Query Two - How many accounts were opened a year
select YEAR(SignUpDate) as YearJoined, COUNT(*) as NumJoined
from AccountHolders
Group By YearJoined;

# Query Three - Which Accounts have taken out what books
select AccountHolders.UserID, AccountHolders.Fname, AccountHolders.Lname, Borrowed.title, Borrowed.DateOfBorrow, Borrowed.ReturnTime
from AccountHolders
Join Borrowed on AccountHolders.UserID = Borrowed.UserID;

# Query Four - What is the most popular Publisher?
select Books.Publisher, count(*) as Borrows
from Borrowed
join Books on Borrowed.Title = Books.Title
group by Books.Publisher
order by Borrows desc;
# Faheem's Queries

# Messages
#Week 1
#Denzel: I am thinking that LibraryAccounts should be part of AccountHolders like sub-tables but I don't know, you guys decide. - 30/03/2026
#Denzel: Oh ya, should we add a Table called ReturnedBooks since we have BorrowedBooks? - 30/03/2026
#Ben: I figured we were gonna only need a borrowed books table. As returned books would be taken off of the borrowed table 01/04
#Ben: We need atleast 3 queries each using group by, aggregates and joins each. For the report we just show what tools we used and what errors we encountered. 01/04
#Denzel: Ah alright, well done on the making the data tables by the way, they look great! - 02/04/2026
#Denzel: I'll look for a workaround behind the foreign keys and also work on my queries considering we have a week off so we can make the best of it lol. - 02/04/2026
#Denzel: I FIXED IT THE FOREIGN KEYS ISSUE, WOOOOO! (WELL I THINK.) Okay so for the first and third one, you needed to add a comma at the end of "IsBorrowed boolean"! - 02/04/2026
#Denzel: While for the second, all I needed to do was to add them together with commas inside of brackets. - 02/04/2026

#Week 2
#Denzel: My brain is blowing up at the moment trying to figure out why Borrowed is giving an error but I am still looking at a wayaround. - 07/04/2026
#Denzel: Now the code fully runs now. However, some sacrifices needed to be made.. (They are in the TODOs errors (＾＾)b ) - 08/04/2026
#Ben: Queries are harder than anticipated - 09/04/2026
#Denzel: Dang, I gonna work on mine now. Good job anyways. - 10/04/2026
#Denzel: Not gonna lie, queries are kind of confusing I agree. - 11/04/2026
#Denzel: Finally done my early queries (yea, I need to work these to look at more polished.)

#Week 3
#Ben: Auto Increment is causing pure havoc, Its preventing the borrowed table from existing, I had to remove it and restore the numbers.13/04/26
#Ben: Even after undoing it, it still thinks its there 13/04/26
#Ben: I have zero clue as to what queries to make, all of the ones I try end up being to complex or requiring AI to create 13/04/26