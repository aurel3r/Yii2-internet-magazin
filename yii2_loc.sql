-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 12 2023 г., 18:33
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2_loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `keywords`, `description`) VALUES
(1, 0, 'Sportswear', NULL, NULL),
(2, 0, 'Mens', NULL, NULL),
(3, 0, 'Womens', NULL, NULL),
(4, 1, 'Nike', NULL, NULL),
(5, 1, 'Under Armour', NULL, NULL),
(6, 1, 'Adidas', NULL, NULL),
(7, 1, 'Puma', NULL, NULL),
(8, 1, 'ASICS', NULL, NULL),
(9, 2, 'Fendi', NULL, NULL),
(10, 2, 'Guess', NULL, NULL),
(11, 2, 'Valentino', NULL, NULL),
(12, 2, 'Dior', NULL, NULL),
(13, 2, 'Versace', NULL, NULL),
(14, 2, 'Armani', NULL, NULL),
(15, 2, 'Prada', NULL, NULL),
(16, 2, 'Dolce and Gabbana', NULL, NULL),
(17, 2, 'Chanel', NULL, NULL),
(18, 2, 'Gucci', NULL, NULL),
(19, 3, 'Fendi', NULL, NULL),
(20, 3, 'Guess', NULL, NULL),
(21, 3, 'Valentino', NULL, NULL),
(22, 3, 'Dior', NULL, NULL),
(23, 3, 'Versace', NULL, NULL),
(24, 0, 'Kids', NULL, NULL),
(25, 0, 'Fashion', NULL, NULL),
(26, 0, 'Households', NULL, NULL),
(27, 0, 'Interiors', NULL, NULL),
(28, 0, 'Clothing', NULL, NULL),
(29, 0, 'Bags', NULL, NULL),
(30, 0, 'Shoes', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orderr`
--

CREATE TABLE `orderr` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int NOT NULL,
  `sum` float NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orderr`
--

INSERT INTO `orderr` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`) VALUES
(1, '2023-12-11 21:36:39', '2023-12-11 21:36:39', 7, 138, '0', 'Whoopi Valencia', 'rohonyvex@mailinator.com', '+1 (316) 133-4305', 'Pariatur Id cupidit'),
(2, '2023-12-11 21:45:50', '2023-12-11 21:45:50', 18, 345, '0', 'Eugenia Lara', 'gawuda@mailinator.com', '+1 (108) 733-5157', 'Culpa soluta suscipi'),
(3, '2023-12-11 21:51:20', '2023-12-11 21:51:20', 7, 145, '0', 'Yvonne Whitehead', 'micufa@mailinator.com', '+1 (514) 581-3259', 'Sit sed ut qui unde ');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `qty_item` int NOT NULL,
  `sum_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `price`, `qty_item`, `sum_item`) VALUES
(1, 2, 15, 'Сумка KORSO', 20, 1, 20),
(2, 2, 1, 'Джинсы Garcia', 20, 5, 100),
(3, 2, 3, 'Блуза Mango', 18, 1, 18),
(4, 2, 7, 'Кардиган Only ON', 27, 1, 27),
(5, 2, 6, 'Кардиган Levis', 18, 10, 180),
(6, 3, 1, 'Джинсы Garcia', 20, 5, 100),
(7, 3, 3, 'Блуза Mango', 18, 1, 18),
(8, 3, 7, 'Кардиган Only ON', 27, 1, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` float NOT NULL DEFAULT '0',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no-image.png',
  `hit` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `new` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sale` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `content`, `price`, `keywords`, `description`, `img`, `hit`, `new`, `sale`) VALUES
(1, 4, 'Джинсы Garcia', 'Великолепные джинсы', 20, NULL, NULL, 'product1.jpg', '0', '0', '0'),
(2, 4, 'Джинсы MR520', 'Mr 520 like', 15, NULL, NULL, 'product2.jpg', '1', '0', '0'),
(3, 9, 'Блуза Mango', 'Испанский бренд', 18, NULL, NULL, 'product3.jpg', '1', '1', '0'),
(4, 21, 'Блуза Tom', 'Vel assumenda aspern', 26, NULL, NULL, 'product4.jpg', '1', '0', '1'),
(5, 25, 'Блузка Kira plastinina', 'In iusto fugiat adip', 23, NULL, NULL, 'product5.jpg', '1', '0', '0'),
(6, 28, 'Кардиган Levis', 'Nemo dolor qui digni', 18, NULL, NULL, 'product6.jpg', '1', '0', '0'),
(7, 28, 'Кардиган Only ON', 'Nihil voluptas ex il', 27, NULL, NULL, 'no-image.png', '1', '1', '0'),
(8, 26, 'Брюки SK HOUSE', 'Ex laborum Ipsa ir', 47, NULL, NULL, 'no-image.png', '0', '0', '1'),
(9, 26, 'Брюки KIRA', 'Quasi ut quo asperio', 41, NULL, NULL, 'product1.jpg', '0', '0', '0'),
(10, 29, 'Сумка Gussaci', 'Quo dolore tempora a', 36, NULL, NULL, 'product3.jpg', '0', '1', '0'),
(11, 29, 'Сумка Michael', 'Modi voluptate occae', 46, NULL, NULL, 'no-image.png', '0', '0', '1'),
(12, 29, 'Сумка Luiviton', 'In blanditiis cupidi', 32, NULL, NULL, 'product5.jpg', '0', '0', '0'),
(13, 29, 'Сумка 228', 'Quidem voluptatem i', 48, NULL, NULL, 'no-image.png', '0', '0', '0'),
(14, 29, 'Сумка KORSO', 'Dolore in est tenet', 26, NULL, NULL, 'no-image.png', '0', '0', '0'),
(15, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0'),
(16, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0'),
(17, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0'),
(18, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0'),
(19, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0'),
(20, 29, 'Сумка KORSO', 'Porro sapiente obcae', 20, NULL, NULL, 'product7.jpg', '0', '0', '0');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `orderr`
--
ALTER TABLE `orderr`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
