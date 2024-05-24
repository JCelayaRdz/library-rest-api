USE `library-rest-api`;

INSERT INTO `publishers` (`name`) VALUES
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster'),
('Macmillan Publishers'),
('Hachette Livre');

INSERT INTO `books` (`title`, `isbn`, `description`, `price`, `publisherId`, `status`, `numberOfCopies`) VALUES
('To Kill a Mockingbird', '9780061120084', 'A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice.', 10.99, 1, 'AVAILABLE', 100),
('1984', '9780451524935', 'Among the seminal texts of the 20th century, 1984 is a rare work that grows more haunting as its futuristic purgatory becomes more real.', 12.50, 2, 'AVAILABLE', 75),
('The Great Gatsby', '9780743273565', 'The Great Gatsby, F. Scott Fitzgerald’s third book, stands as the supreme achievement of his career.', 9.99, 3, 'AVAILABLE', 120),
('The Catcher in the Rye', '9780316769488', 'The hero-narrator of The Catcher in the Rye is an ancient child of sixteen, a native New Yorker named Holden Caulfield.', 11.25, 4, 'AVAILABLE', 90),
('Moby-Dick', '9780142000083', 'Moby-Dick is a novel by Herman Melville, first published in 1851.', 14.75, 5, 'AVAILABLE', 110);

INSERT INTO `authors` (`name`) VALUES
('Harper Lee'),
('George Orwell'),
('F. Scott Fitzgerald'),
('J.D. Salinger'),
('Herman Melville');

INSERT INTO `books_authors` (`bookId`, `authorId`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO `genres` (`name`) VALUES
('Fiction'),
('Classics'),
('Mystery'),
('Science Fiction'),
('Thriller');

INSERT INTO `books_genres` (`bookId`, `genreId`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(5, 2);

INSERT INTO `users` (`username`, `password`, `email`, `role`) VALUES
('admin', '$2a$10$T7b0IWG.eHdHx0yI0esGwOAp/hVRvtd6q9hMY5EGU5Jk2pgsv1M7m', 'admin@example.com', 'admin'),
('user1', '$2a$10$T7b0IWG.eHdHx0yI0esGwOAp/hVRvtd6q9hMY5EGU5Jk2pgsv1M7m', 'user1@example.com', 'customer'),
('user2', '$2a$10$T7b0IWG.eHdHx0yI0esGwOAp/hVRvtd6q9hMY5EGU5Jk2pgsv1M7m', 'user2@example.com', 'customer'),
('user3', '$2a$10$T7b0IWG.eHdHx0yI0esGwOAp/hVRvtd6q9hMY5EGU5Jk2pgsv1M7m', 'user3@example.com', 'customer'),
('user4', '$2a$10$T7b0IWG.eHdHx0yI0esGwOAp/hVRvtd6q9hMY5EGU5Jk2pgsv1M7m', 'user4@example.com', 'customer');

INSERT INTO `purchases` (`userId`, `bookId`, `totalPrice`, `purchasedAt`) VALUES
(2, 1, 10.99, NOW()),
(3, 3, 9.99, NOW()),
(4, 5, 14.75, NOW()),
(5, 2, 12.50, NOW()),
(3, 4, 11.25, NOW());

INSERT INTO `reviews` (`bookId`, `userId`, `rating`) VALUES
(1, 2, 4.5),
(3, 3, 5),
(5, 4, 4),
(2, 5, 4.5),
(4, 3, 4);
