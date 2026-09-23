-- Zomato Restaurant Analytics — SQL Analysis
-- MySQL 8.0.42
-- Database: zomato_analysis
-- Table: zomato_restaurants

CREATE DATABASE IF NOT EXISTS zomato_analysis;
USE zomato_analysis;


-- 1. Restaurant records by location
SELECT
    location,
    COUNT(*) AS restaurant_count
FROM zomato_restaurants
GROUP BY location
ORDER BY restaurant_count DESC
LIMIT 10;


-- 2. Average rating by location
SELECT
    location,
    COUNT(rate) AS rated_restaurants,
    ROUND(AVG(rate), 2) AS avg_rating
FROM zomato_restaurants
WHERE rate IS NOT NULL
GROUP BY location
HAVING COUNT(rate) >= 100
ORDER BY avg_rating DESC
LIMIT 10;


-- 3. Most common restaurant types
SELECT
    rest_type,
    COUNT(*) AS restaurant_count
FROM zomato_restaurants
GROUP BY rest_type
ORDER BY restaurant_count DESC
LIMIT 10;


-- 4. Average rating by restaurant type
SELECT
    rest_type,
    COUNT(rate) AS rated_restaurants,
    ROUND(AVG(rate), 2) AS avg_rating
FROM zomato_restaurants
WHERE rate IS NOT NULL
GROUP BY rest_type
HAVING COUNT(rate) >= 100
ORDER BY avg_rating DESC
LIMIT 10;


-- 5. Most common cuisines
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cuisines, ',', numbers.n), ',', -1)) AS cuisine,
    COUNT(*) AS restaurant_count
FROM zomato_restaurants
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10
) numbers
ON numbers.n <= 1 + LENGTH(cuisines) - LENGTH(REPLACE(cuisines, ',', ''))
WHERE cuisines IS NOT NULL
GROUP BY cuisine
ORDER BY restaurant_count DESC
LIMIT 15;


-- 6. Online ordering and ratings
SELECT
    online_order,
    COUNT(rate) AS rated_restaurants,
    ROUND(AVG(rate), 2) AS avg_rating,
    ROUND(AVG(votes), 0) AS avg_votes
FROM zomato_restaurants
WHERE rate IS NOT NULL
GROUP BY online_order
ORDER BY avg_rating DESC;


-- 7. Table booking and ratings
SELECT
    book_table,
    COUNT(rate) AS rated_restaurants,
    ROUND(AVG(rate), 2) AS avg_rating,
    ROUND(AVG(votes), 0) AS avg_votes
FROM zomato_restaurants
WHERE rate IS NOT NULL
GROUP BY book_table
ORDER BY avg_rating DESC;


-- 8. Online ordering + table booking
SELECT
    online_order,
    book_table,
    COUNT(rate) AS rated_restaurants,
    ROUND(AVG(rate), 2) AS avg_rating,
    ROUND(AVG(votes), 0) AS avg_votes
FROM zomato_restaurants
WHERE rate IS NOT NULL
GROUP BY online_order, book_table
ORDER BY avg_rating DESC;
