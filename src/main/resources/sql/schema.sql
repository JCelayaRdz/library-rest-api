CREATE SCHEMA IF NOT EXISTS `library-rest-api`;

USE `library-rest-api`;

CREATE TABLE IF NOT EXISTS `publishers`
(
    publisherId INT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (publisherId)
);

CREATE TABLE IF NOT EXISTS `books`
(
    bookId INT UNIQUE NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    description VARCHAR(200),
    price DECIMAL (10, 2) NOT NULL,
    publisherId INT NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('AVAILABLE', 'UNAVAILABLE')),
    numberOfCopies INT NOT NULL,
    FOREIGN KEY (publisherId) REFERENCES `publishers`(publisherId),
    PRIMARY KEY (bookId)
);


CREATE TABLE `authors`
(
    authorId INT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (authorId)
);

CREATE TABLE IF NOT EXISTS `books_authors`
(
    bookId INT NOT NULL,
    authorId INT NOT NULL,
    PRIMARY KEY (bookId, authorId),
    FOREIGN KEY (bookId) REFERENCES `books`(bookId),
    FOREIGN KEY (authorId) REFERENCES `authors`(authorId)
);

CREATE TABLE IF NOT EXISTS `genres`
(
    genreId INT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (genreId)
);

CREATE TABLE IF NOT EXISTS `books_genres`
(
    bookId INT NOT NULL,
    genreId INT NOT NULL,
    PRIMARY KEY (bookId, genreId),
    FOREIGN KEY (bookId) REFERENCES `books`(bookId),
    FOREIGN KEY (genreId) REFERENCES `genres`(genreId)
);

CREATE TABLE IF NOT EXISTS `users`
(
    userId INT UNIQUE NOT NULL AUTO_INCREMENT,
    username VARCHAR(25) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    role VARCHAR(8) CHECK (role IN ('admin', 'customer')),
    PRIMARY KEY (userId)
);

CREATE TABLE IF NOT EXISTS `purchases`
(
    purchaseId INT UNIQUE NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    bookId INT NOT NULL,
    totalPrice DECIMAL(10, 2) NOT NULL,
    purchasedAt DATETIME NOT NULL,
    FOREIGN KEY (userId) REFERENCES `users`(userId),
    FOREIGN KEY (bookId) REFERENCES `books`(bookId),
    PRIMARY KEY (purchaseId)
);

CREATE TABLE IF NOT EXISTS `reviews`
(
    reviewId INT UNIQUE NOT NULL AUTO_INCREMENT,
    bookId INT NOT NULL,
    userId INT NOT NULL,
    rating DECIMAL(2, 1) CHECK (rating % 0.5 = 0),
    FOREIGN KEY (bookId) REFERENCES `books`(bookId),
    FOREIGN KEY (userId) REFERENCES `users`(userId),
    PRIMARY KEY (reviewId)
);