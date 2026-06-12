-- =====================================================
-- ===================== ĐÁP ÁN =========================
-- =====================================================

-- Bài 1
SELECT u.name, o.total
FROM users u
INNER JOIN orders o
ON u.id = o.user_id;

-- Bài 2
SELECT o.id, u.name, o.total
FROM users u
INNER JOIN orders o
ON u.id = o.user_id;

-- Bài 3
SELECT o.*
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
WHERE u.name = 'Trung';

-- Bài 4
SELECT u.name, o.total
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
WHERE o.total > 500000;

-- Bài 5
SELECT u.email, o.total
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
ORDER BY o.total DESC;

-- Bài 6
SELECT u.name, o.total
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id;

-- Bài 7
SELECT u.*
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id
WHERE o.id IS NULL;

-- Bài 8
SELECT u.name, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id
GROUP BY u.name;

-- Bài 9
SELECT u.name, SUM(o.total) AS total_money
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
GROUP BY u.name;

-- Bài 10
SELECT u.name, COUNT(o.id) AS total_orders
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
GROUP BY u.name
HAVING COUNT(o.id) >= 2;

-- Bài 11
SELECT *
FROM orders
WHERE total > (
    SELECT AVG(total)
    FROM orders
);

-- Bài 12
SELECT *
FROM orders
WHERE total = (
    SELECT MAX(total)
    FROM orders
);

-- Bài 13
SELECT *
FROM orders
WHERE total = (
    SELECT MIN(total)
    FROM orders
);

-- Bài 14
SELECT *
FROM orders
WHERE user_id = (
    SELECT id
    FROM users
    WHERE id = 1
);

-- Bài 15
SELECT *
FROM users
WHERE id = (
    SELECT user_id
    FROM orders
    WHERE total = (
        SELECT MAX(total)
        FROM orders
    )
);

-- Bài 16
SELECT *
FROM users
WHERE id IN (
    SELECT user_id
    FROM orders
    WHERE total > 1000000
);

-- Bài 17
SELECT *
FROM users
WHERE id NOT IN (
    SELECT user_id
    FROM orders
);

-- Bài 18
SELECT *
FROM orders
WHERE total < (
    SELECT AVG(total)
    FROM orders
);

-- Bài 19
SELECT u.name, SUM(o.total) AS total_money
FROM users u
JOIN orders o
ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_money DESC
LIMIT 1;

-- Bài 20
SELECT u.name, COUNT(o.id) AS total_orders
FROM users u
JOIN orders o
ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_orders DESC
LIMIT 1;