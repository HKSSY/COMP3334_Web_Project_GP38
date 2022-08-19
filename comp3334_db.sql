-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 04 月 17 日 22:21
-- 伺服器版本： 10.3.32-MariaDB
-- PHP 版本： 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `comp3334_db`
--

-- --------------------------------------------------------

--
-- 資料表結構 `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `self_description` varchar(800) DEFAULT NULL,
  `permission` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `accounts`
--

INSERT INTO `accounts` (`id`, `nickname`, `password`, `email`, `dob`, `gender`, `self_description`, `permission`) VALUES
(1, 'test', '$2y$10$mwUdC.awaz3kJahr5oysBeYP1IiRHe1XifaixtzqUXhl4W6ulRM8m', 'test@test.com', '2000-01-01', 'Male', 'Hello world', 1),
(41, 'may', '$2y$10$inzt8ACqLVLramE9TAU4Pe2jTFfOI5BUWhH0QR4b7hGj96uZbciN.', 'may@test.com', '2005-07-20', 'Female', 'LOL', 0),
(42, 'test99', '$2y$10$zxMPBvU7Tbyu4cyyTaT1a.SuCHKcllcfLnovEgOMzwm7lOMtt8yTi', 'test99@test.com', '2006-02-07', 'Male', 'dfgdfgdfgfdg', 0),
(43, 'tom', '$2y$10$oJzRrRnILWyez53x7m10OOqVi0er.tQZCP/dPQTe4jeeY8ktKk5DK', 'tom@tom.com', '2005-08-16', 'Male', NULL, 0),
(44, '<script>alert(\"XSS attack test\");</script>', '$2y$10$vmHEsWJs/rdCfe3ixlziCOTn2i/FG9tQErs4DPji4SemHmx4XL7Ru', 'script@test.com', '2006-02-07', 'Male', '<script>alert(\"XSS attack test\");</script>', 0),
(45, 'alex', '$2y$10$OrR/H5QiPro1b2JPjMK.a.i4PxH8mUZ2HhUUx80.8Psi1VXeBLVyq', 'alex@test.com', '2005-07-12', 'Male', 'I am free', 0),
(46, 'admin', '$2y$10$7Q7X5MFrzczUeQPyuczKIOWwSXYOQ4AtaMDiliUfhkzTGO8usKoV2', 'sdfsds@yahoo.com.hk', '2006-03-27', 'Male', '8964\r\n', 0),
(47, 'test', '$2y$10$sJupXH4.YzMLBtLhLUrOC.xO2KhArdHyo8CIG23Af.kk1/hNM5HuK', 'hello@test.com', '2006-03-29', 'Male', NULL, 0),
(48, 'root1', '$2y$10$QcvzXZ0eB3/jpRQsee1aGuyiyVJjjIT2gl9Ie4OyTV9Nj7AcYRiDy', 'root@yahoo.com.hk', '2001-02-07', 'Male', NULL, 1),
(49, 'root2', '$2y$10$wfkyKAp/vkAtEYZ/0Ex2v.3DUumF7KxKMEvxaD1hN9oSNLG7zq2fe', 'root2@yahoo.com.hk', '2002-02-20', 'Male', NULL, 0),
(50, 'root3', '$2y$10$el3xRWTJ6QO01JMsUwhCFu/X8NDTwsjUHeET/v2RxRSFbwjuYP9ku', 'dsafs@yahoo.com.hk', '2002-07-24', 'Male', NULL, 0),
(51, 'testing', '$2y$10$6.XOsXnN4h5jfQfb7j.sHO7WYK6Xqz/JaWlZ0Cmh1nvRfEgCrSO8a', 'testing@test.com', '2006-04-05', 'Female', NULL, 0),
(52, 'Oscar Ng', '$2y$10$qyecT0iauneLmfJl0j.oZeCcUIyMdWMwU4zCH.4RKsXPAaCDS8c/y', 'ngoscar9008@gmail.com', '2006-04-04', 'Male', NULL, 0),
(53, '<script>alert(\"hacked!!!\");</script>', '$2y$10$K1iUUMlvMq0i283c8EKaQOvrPdr1I9DnbVWnbyP7fZd0zE8YU9YGy', 'ngoscar8009@gmail.com', '2006-04-04', 'Male', NULL, 0),
(54, 'ben', '$2y$10$kEU3NeTKV1fq7GOQP6Bk2.XNHngapqYVAVTTKnG5Io67nsR.T7f0m', 'ben@gmail.com', '2004-12-31', 'Male', NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(1) NOT NULL DEFAULT 1,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'Right-click and Save As guy', 'The Right-click and Save As guy is the name of an NFT artwork created by the artist as a joke on those who think that NFTs are worthless because they can simply be right-clicked and downloaded.', '1180.00', '1199.00', 1, 'product_items/1650054258Right-Click-and-Save-guy-1.gif', '2022-04-10 17:55:22'),
(2, 'Ringers #109', 'Ringers #109 is a static image of a series of loops around multiple pegs. The dominant colour is black on a white background. The balanced wrap orientation, the loop and the white background are three very rare attributes in Art Blocks’ creations. The rarest is, however, a red peg — the colour is present in just 0.3 percent of its tokens.', '6300.00', '6480.00', 1, 'product_items/1650055334Ringers-560x560-1.webp', '2019-04-10 18:52:49'),
(3, 'CryptoPunk #7804', 'The pipe-smoking character wears small shades and is one of the 254 who wears their cap forward. Unlike #3100, the #7804 is not up for sale.', '799.00', '0.00', 1, 'product_items/1650055385Punk-7804-900x900-1.webp', '2019-04-10 22:16:41'),
(7, '#15753 - In it for the technology', NULL, '14370.00', '20000.00', 1, 'product_items/16501088261_muNEhNivLaQmanCiTbAELQ.jpeg', '2022-04-11 02:45:12'),
(8, 'Nyan Cat', 'In celebration of the 10th birthday of Nyan Cat, an animated gif of a cat with a Pop Tart body flying through space, trailed by a streaming rainbow, creator Chris Torres turned the meme into an NFT and auctioned it off.', '3260.00', '4000.00', 0, 'product_items/1650112880NYAN-CAT-ARTINTERVIEW-copy.webp', '2022-04-11 13:48:41'),
(24, 'Metarift', NULL, '8888.00', '8888.00', 0, 'product_items/165011717984c020c9d089aa7c7ffaacb66ba4251a_808198.webp', '2022-04-16 21:52:59'),
(25, 'hairy', 'Capitalizing on NFT mania, DJ and producer Steve Aoki released an 11-piece digital art collection, called “Dreamcatcher,” with German 3-D illustrator Antoni Tudisco.', '5888.00', '6888.00', 1, 'product_items/1650117244hairy_-_Carly_Bernstein_kr6a67.jpg', '2022-04-16 21:54:03'),
(26, 'Forever Rose', 'At the time of its $1 million sale on Valentine’s Day in 2018, the piece was the world’s most expensive piece of NFT art.', '5522.00', '5522.00', 1, 'product_items/1650117735forever_rose_abosch_2000-1024x1024.jpg', '2022-04-16 22:02:14'),
(27, 'Crossroads', 'Beeple minted his first NFTs in October 2020, for a sale he titled “The First Drop.”', '8765.00', '8800.00', 1, 'product_items/1650117854Partial-view-of-Beeples-CROSSROAD-1-1_viaNiftyGateway.webp', '2022-04-16 22:04:14');

-- --------------------------------------------------------

--
-- 資料表結構 `profile_images`
--

CREATE TABLE `profile_images` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(35) NOT NULL,
  `description` varchar(45) NOT NULL,
  `filepath` text NOT NULL,
  `uploaded_date` datetime NOT NULL DEFAULT current_timestamp(),
  `profile_image` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `profile_images`
--

INSERT INTO `profile_images` (`id`, `userid`, `title`, `description`, `filepath`, `uploaded_date`, `profile_image`) VALUES
(1, 1, '', '', 'profile_image/1649931245VvNhMb0.jpg', '2022-04-14 18:14:04', 1),
(19, 44, '', '', 'profile_image/1649528859Tehurn-1483160975255773192-img1.jpg', '2022-04-10 02:27:38', 1),
(20, 52, '<script>alert(\"ha!\");</script>', '<script>alert(\"hacked!!!\");</script>', 'profile_image/16496161881.png', '2022-04-11 02:43:07', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `sales_record`
--

CREATE TABLE `sales_record` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` decimal(7,2) NOT NULL,
  `product_img` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `sales_record`
--

INSERT INTO `sales_record` (`id`, `product_id`, `product_name`, `product_price`, `product_img`, `user_id`, `date_added`) VALUES
(14, 8, 'Nyan Cat', '3260.00', 'product_items/1650112880NYAN-CAT-ARTINTERVIEW-copy.webp', 54, '2022-04-17 04:35:53'),
(15, 25, 'hairy', '5888.00', 'product_items/1650117244hairy_-_Carly_Bernstein_kr6a67.jpg', 48, '2022-04-17 04:37:35'),
(16, 24, 'Metarift', '8888.00', 'product_items/165011717984c020c9d089aa7c7ffaacb66ba4251a_808198.webp', 1, '2022-04-17 20:10:43'),
(17, 27, 'Crossroads', '8765.00', 'product_items/1650117854Partial-view-of-Beeples-CROSSROAD-1-1_viaNiftyGateway.webp', 48, '2022-04-17 21:59:32'),
(18, 26, 'Forever Rose', '5522.00', 'product_items/1650117735forever_rose_abosch_2000-1024x1024.jpg', 48, '2022-04-17 22:01:27'),
(19, 8, 'Nyan Cat', '3260.00', 'product_items/1650112880NYAN-CAT-ARTINTERVIEW-copy.webp', 44, '2022-04-17 22:17:37');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `profile_images`
--
ALTER TABLE `profile_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`userid`);

--
-- 資料表索引 `sales_record`
--
ALTER TABLE `sales_record`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `profile_images`
--
ALTER TABLE `profile_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sales_record`
--
ALTER TABLE `sales_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `profile_images`
--
ALTER TABLE `profile_images`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`userid`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
