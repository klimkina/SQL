CREATE DATABASE db_library;

USE db_library
GO

CREATE TABLE tbl_publishers (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	BookId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publishers(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_authors (
	BookId INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_library_branch (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
	BookId INT NOT NULL CONSTRAINT fk_bookid FOREIGN KEY REFERENCES tbl_books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId INT NOT NULL CONSTRAINT fk_brahch_id FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut date,
	DueDate date
);

CREATE TABLE tbl_book_copies (
	BookId INT NOT NULL CONSTRAINT fk_book_copy_id FOREIGN KEY REFERENCES tbl_books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId INT NOT NULL CONSTRAINT fk_copy_brahch_id FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

INSERT INTO tbl_publishers
	(Name, Address, Phone)
	VALUES
	('Pearson', 'UK', '123456789'),
	('Shogakukan', 'Japan', '123456789'),
	('WEKA', 'Germany', '123456789'),
	('Arthur A. Levine Books', 'USA', '123456789')
;
INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Pearson'),
	('Fantastic Beasts and Where to Find Them', 'Pearson'),
	('Shelter in Place', 'Pearson'),
	('Come Sundown', 'Pearson'),
	('The Obsession', 'Shogakukan'),
	('Dairy of a Wimpy Kid', 'Shogakukan'),
	('The Good Samaritan', 'Shogakukan'),
	('When you Disappeared', 'Shogakukan'),
	('Wonder', 'Shogakukan'),
	('We are all Wanders', 'Shogakukan'),
	('The People vs. Alex Cross','Shogakukan'),
	('The Black Book', 'WEKA'),
	('The Gender Game', 'WEKA'),
	('Sleeping Beauties', 'WEKA'),
	('It', 'WEKA'),
	('The Dark Tower', 'WEKA'),
	('The Shining', 'WEKA'),
	('First 100 Words', 'WEKA'),
	('Wipe Clean: Letters', 'WEKA'),
	('Edgedancer', 'WEKA'),
	('The Way of Kings', 'Arthur A. Levine Books'),
	('Harry Potter and the Prisoner of Azkaban', 'Arthur A. Levine Books'),
	('Harry Potter and the Chamber of Secrets', 'Arthur A. Levine Books'),
	('Harry Potter and the Sorcerer''s Stone', 'Arthur A. Levine Books'),
	('Harry Potter and the Cursed Child', 'Arthur A. Levine Books'),
	('Harry Potter and the Deathly Hallows', 'Arthur A. Levine Books'),
	('Harry Potter and the Half-Blood Prince', 'Arthur A. Levine Books')
;
INSERT INTO tbl_book_authors
	(BookId, AuthorName)
	VALUES
	(2, 'J. K. Rowling'),
	(3, 'Nora Roberts'),
	(4, 'Nora Roberts'),
	(5, 'Nora Roberts'),
	(6, 'Jeff Kinney'),
	(7, 'John Marrs'),
	(8, 'John Marrs'),
	(9, 'R. J. Palacio'),
	(10, 'R. J. Palacio'),
	(11, 'James Patterson'),
	(12, 'James Patterson'),
	(13, 'Bella Forrest'),
	(14, 'Stephen King'),
	(15, 'Stephen King'),
	(16, 'Stephen King'),
	(17, 'Stephen King'),
	(18, 'Roger Priddy'),
	(19, 'Roger Priddy'),
	(20, 'Brandon Sanderson'),
	(21, 'Brandon Sanderson'),
	(22, 'J. K. Rowling'),
	(23, 'J. K. Rowling'),
	(24, 'J. K. Rowling'),
	(25, 'J. K. Rowling'),
	(26, 'J. K. Rowling'),
	(27, 'J. K. Rowling'),
	(1, 'Mark Lee')
;
INSERT INTO tbl_borrower
	(Name, Address, Phone)
	VALUES
	('James	Butt',	'6649 N Blue Gum St	New Orleans	Orleans	LA	70116',	'504-621-8927'),
	('Josephine	Darakjy	Chanay',	'4 B Blue Ridge Blvd	Brighton	Livingston	MI	48116',	'810-292-9388'),
	('Art	Venere	Chemel',	'8 W Cerritos Ave #54	Bridgeport	Gloucester	NJ	8014',	'856-636-8749'),
	('Lenna	Paprocki',	'639 Main St	Anchorage	Anchorage	AK	99501',	'907-385-4412'),
	('Donette	Foller',	'34 Center St	Hamilton	Butler	OH	45011',	'513-570-1893'),
	('Simona	Morasca	Chapman',	'3 Mcauley Dr	Ashland	Ashland	OH	44805',	'419-503-2484'),
	('Mitsue	Tollner',	'7 Eads St	Chicago	Cook	IL	60632',	'773-573-6914'),
	('Leota	Dilliard',	'7 W Jackson Blvd	San Jose	Santa Clara	CA	95111',	'408-752-3500'),
	('Sage	Wieser',	'5 Boston Ave #88	Sioux Falls	Minnehaha	SD	5710',	'605-414-2147'),
	('Kris	Marrier	King',	'228 Runamuck Pl 2808	Baltimore City	MD	21224',	'410-655-8723'),
	('Minna	Amigon	Dorl',	'2371 Jerrold Ave	Kulpsville	Montgomery	PA	19443',	'215-874-1229'),
	('Abel	Maclead',	'37275 St  Rt 17m M	Middle Island	Suffolk	NY	11953',	'631-335-3414'),
	('Kiley	Caldarera',	'25 E 75th St 69 Los Angeles CA	90034',	'310-498-5651'),
	('Graciela Ruta', '98 Connecticut Ave Nw Chagrin Falls Geauga OH 2311',	'440-780-8425')
	
;
INSERT INTO tbl_library_branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '395 Glen Creek Rd NW, Salem, OR 97304'),
	('Central', '2850 NE Brookwood Pkwy, Hillsboro, OR 97124'),
	('Cedar Mill Community Library', '15325 Northwest Central Drive, Portland, OR 97229'),
	('Hillsdale Library', '1525 SW Sunset Blvd, Portland, OR 97239')
;
INSERT INTO tbl_book_loans
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	(1, 6, 12, '2017-12-01', '2017-12-21'  ),
	(2, 6, 12, '2017-12-01', '2017-12-12'  ),
	(3, 6, 12, '2017-12-01', '2017-12-14'  ),
	(4, 6, 12, '2017-12-01', '2017-12-21'  ),
	(1, 6, 11, '2017-12-01', '2017-12-16'  ),
	(21, 7, 11, '2017-12-01', '2017-12-11'  ),
	(12, 7, 11, '2017-12-01', '2017-12-09'  ),
	(14, 7, 13, '2017-12-01', '2017-12-28'  ),
	(14, 7, 14, '2017-12-01', '2017-12-05'  ),
	(1, 8, 15, '2017-12-01', '2017-12-14'  ),
	(3, 8, 15, '2017-12-01', '2017-12-16'  ),
	(20, 8, 16, '2017-12-01', '2017-12-13'  ),
	(12, 8, 16, '2017-12-01', '2017-12-14'  ),
	(14, 8, 16, '2017-12-01', '2017-12-01'  ),
	(15, 8, 16, '2017-12-01', '2017-12-06'  ),
	(16, 8, 16, '2017-12-01', '2017-12-03'  )
;
INSERT INTO tbl_book_copies
	(BookId, BranchId, No_Of_Copies)
	VALUES
	(1, 6, 2),
	(2, 6, 2),
	(3, 6, 2),
	(4, 6, 2),
	(5, 7, 2),
	(6, 7, 2),
	(7, 7, 2),
	(8, 7, 2),
	(9, 8, 2),
	(10, 8, 2),
	(11, 8, 2),
	(12, 8, 2),
	(13, 8, 2)
;

SELECT SUM(No_Of_Copies)
	FROM tbl_books INNER JOIN tbl_book_copies ON tbl_books.BookId = tbl_book_copies.BookId
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchId = tbl_library_branch.BranchId
	WHERE tbl_library_branch.BranchName = 'Sharpstown';

SELECT SUM(No_Of_Copies)
	FROM tbl_books INNER JOIN tbl_book_copies ON tbl_books.BookId = tbl_book_copies.BookId
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchId = tbl_library_branch.BranchId
	WHERE tbl_books.Title = 'The Lost Tribe'
	GROUP By tbl_library_branch.BranchId;

SELECT DISTINCT Name FROM tbl_borrower
	WHERE tbl_borrower.CardNo NOT IN
	(SELECT DISTINCT CardNo FROM tbl_book_loans);

SELECT Title, Name, Address
	FROM tbl_book_loans INNER JOIN tbl_borrower ON tbl_book_loans.CardNo = tbl_borrower.CardNo
	INNER JOIN tbl_books ON tbl_book_loans.BookId = tbl_books.BookId
	WHERE tbl_book_loans.DueDate IN (SELECT DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0));

SELECT COUNT(*)
	FROM tbl_book_loans INNER JOIN tbl_library_branch ON tbl_book_loans.BranchId = tbl_library_branch.BranchId
	GROUP BY tbl_library_branch.BranchId;

SELECT Name, Address, COUNT(*) AS 'Number of Books OUT'
	FROM tbl_book_loans INNER JOIN tbl_borrower ON tbl_book_loans.CardNo = tbl_borrower.CardNo
	GROUP BY tbl_borrower.CardNo, tbl_borrower.Name, tbl_borrower.Address
	HAVING COUNT(*) > 5;

SELECT Title, SUM(No_Of_Copies)
	FROM tbl_books INNER JOIN tbl_book_copies ON tbl_books.BookId = tbl_book_copies.BookId
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchId = tbl_library_branch.BranchId
	INNER JOIN tbl_book_authors ON tbl_books.BookId = tbl_book_authors.BookId
	WHERE tbl_library_branch.BranchName = 'Central' AND tbl_book_authors.AuthorName = 'Stephen King'
	GROUP BY tbl_books.Title;
	