-- =========================================
-- SETUP: tạo bảng kho hàng products
-- =========================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(12,2) CHECK (price >= 0),
    quantity INT CHECK (quantity >= 0)
);

INSERT INTO products (name, category, price, quantity) VALUES
('Laptop Dell', 'Electronics', 18000000, 10),
('iPhone 15', 'Electronics', 22000000, 5),
('Mouse Logitech', 'Accessories', 350000, 50),
('Keyboard Akko', 'Accessories', 1200000, 25),
('Office Chair', 'Furniture', 2500000, 8),
('Desk Wooden', 'Furniture', 3200000, 4),
('Notebook A5', 'Stationery', 25000, 200),
('Pen Thiên Long', 'Stationery', 5000, 500),
('Water Bottle', 'Lifestyle', 150000, 30),
('Backpack', 'Lifestyle', 650000, 15);


-- =========================================
-- 1. SELECT: lấy dữ liệu
-- =========================================

-- Bài 1: Lấy tất cả sản phẩm
SELECT * FROM products;

-- Bài 2: Lấy name và price của tất cả sản phẩm
SELECT name, price FROM products;

-- Bài 3: Đổi tên cột name thành product_name
SELECT name AS product_name, price FROM products;

-- Bài 4: Tính tổng giá trị tồn kho của từng sản phẩm = price * quantity
SELECT name, price, quantity, price * quantity AS total_value
FROM products;

-- Bài 5: Lấy category không trùng nhau
SELECT DISTINCT category FROM products;


-- =========================================
-- 2. WHERE: lọc dữ liệu
-- =========================================

-- Bài 1: Lấy sản phẩm có giá lớn hơn 1 triệu
SELECT * FROM products
WHERE price > 1000000;

-- Bài 2: Lấy sản phẩm thuộc category Electronics
SELECT * FROM products
WHERE category = 'Electronics';

-- Bài 3: Lấy sản phẩm có quantity nhỏ hơn hoặc bằng 10
SELECT * FROM products
WHERE quantity <= 10;

-- Bài 4: Lấy sản phẩm giá từ 100k đến 2 triệu
SELECT * FROM products
WHERE price BETWEEN 100000 AND 2000000;

-- Bài 5: Lấy sản phẩm có tên chứa chữ "o"
SELECT * FROM products
WHERE name ILIKE '%o%';


-- =========================================
-- 3. AND, OR, IN
-- =========================================

-- Bài 1: Lấy sản phẩm Electronics và giá trên 20 triệu
SELECT * FROM products
WHERE category = 'Electronics' AND price > 20000000;

-- Bài 2: Lấy sản phẩm Furniture hoặc Lifestyle
SELECT * FROM products
WHERE category = 'Furniture' OR category = 'Lifestyle';

-- Bài 3: Viết lại bài 2 bằng IN
SELECT * FROM products
WHERE category IN ('Furniture', 'Lifestyle');

-- Bài 4: Lấy sản phẩm category Accessories và quantity > 20
SELECT * FROM products
WHERE category = 'Accessories' AND quantity > 20;

-- Bài 5: Lấy sản phẩm giá dưới 100k hoặc quantity trên 100
SELECT * FROM products
WHERE price < 100000 OR quantity > 100;


-- =========================================
-- 4. ORDER BY, LIMIT, OFFSET
-- =========================================

-- Bài 1: Sắp xếp sản phẩm theo giá tăng dần
SELECT * FROM products
ORDER BY price ASC;

-- Bài 2: Sắp xếp sản phẩm theo giá giảm dần
SELECT * FROM products
ORDER BY price DESC;

-- Bài 3: Lấy 3 sản phẩm đắt nhất
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- Bài 4: Lấy 5 sản phẩm có quantity nhiều nhất
SELECT * FROM products
ORDER BY quantity DESC
LIMIT 5;

-- Bài 5: Phân trang: bỏ qua 5 dòng đầu, lấy 5 dòng tiếp theo
SELECT * FROM products
ORDER BY id
LIMIT 5 OFFSET 5;


-- =========================================
-- 5. INSERT
-- =========================================

-- Bài 1: Thêm một sản phẩm mới
INSERT INTO products (name, category, price, quantity)
VALUES ('USB 32GB', 'Accessories', 120000, 40);

-- Bài 2: Thêm sản phẩm và trả về dòng vừa thêm
INSERT INTO products (name, category, price, quantity)
VALUES ('Monitor LG', 'Electronics', 3500000, 7)
RETURNING *;

-- Bài 3: Thêm 2 sản phẩm cùng lúc
INSERT INTO products (name, category, price, quantity)
VALUES 
('Eraser', 'Stationery', 7000, 100),
('Ruler', 'Stationery', 12000, 80);

-- Bài 4: Thêm sản phẩm quantity = 0
INSERT INTO products (name, category, price, quantity)
VALUES ('Old Speaker', 'Electronics', 900000, 0);

-- Bài 5: Thêm sản phẩm Lifestyle
INSERT INTO products (name, category, price, quantity)
VALUES ('Cap', 'Lifestyle', 180000, 20);


-- =========================================
-- 6. UPDATE
-- =========================================

-- Bài 1: Tăng giá Mouse Logitech lên 400000
UPDATE products
SET price = 400000
WHERE name = 'Mouse Logitech'
RETURNING *;

-- Bài 2: Giảm quantity của iPhone 15 đi 1
UPDATE products
SET quantity = quantity - 1
WHERE name = 'iPhone 15'
RETURNING *;

-- Bài 3: Tăng giá tất cả sản phẩm Stationery thêm 10%
UPDATE products
SET price = price * 1.1
WHERE category = 'Stationery'
RETURNING *;

-- Bài 4: Đổi category của USB 32GB thành Storage
UPDATE products
SET category = 'Storage'
WHERE name = 'USB 32GB'
RETURNING *;

-- Bài 5: Set quantity = 100 cho sản phẩm có quantity = 0
UPDATE products
SET quantity = 100
WHERE quantity = 0
RETURNING *;


-- =========================================
-- 7. DELETE
-- =========================================

-- Bài 1: Xóa sản phẩm tên Ruler
DELETE FROM products
WHERE name = 'Ruler'
RETURNING *;

-- Bài 2: Xóa sản phẩm có quantity = 0
DELETE FROM products
WHERE quantity = 0
RETURNING *;

-- Bài 3: Xóa sản phẩm giá dưới 10000
DELETE FROM products
WHERE price < 10000
RETURNING *;

-- Bài 4: Xóa sản phẩm category Storage
DELETE FROM products
WHERE category = 'Storage'
RETURNING *;

-- Bài 5: Xóa sản phẩm có id lớn hơn 100
DELETE FROM products
WHERE id > 100
RETURNING *;


-- =========================================
-- 8. GROUP BY, COUNT, SUM, AVG, MIN, MAX
-- =========================================

-- Bài 1: Đếm số sản phẩm theo từng category
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

-- Bài 2: Tính tổng quantity theo từng category
SELECT category, SUM(quantity) AS total_quantity
FROM products
GROUP BY category;

-- Bài 3: Tính giá trung bình theo từng category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Bài 4: Tìm giá thấp nhất và cao nhất trong từng category
SELECT category, MIN(price) AS min_price, MAX(price) AS max_price
FROM products
GROUP BY category;

-- Bài 5: Tính tổng giá trị tồn kho theo từng category
SELECT category, SUM(price * quantity) AS total_inventory_value
FROM products
GROUP BY category;


-- =========================================
-- 9. HAVING
-- =========================================

-- Bài 1: Lấy category có hơn 1 sản phẩm
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;

-- Bài 2: Lấy category có tổng quantity trên 50
SELECT category, SUM(quantity) AS total_quantity
FROM products
GROUP BY category
HAVING SUM(quantity) > 50;

-- Bài 3: Lấy category có giá trung bình trên 1 triệu
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 1000000;

-- Bài 4: Lấy category có tổng tồn kho trên 10 triệu
SELECT category, SUM(price * quantity) AS total_value
FROM products
GROUP BY category
HAVING SUM(price * quantity) > 10000000;

-- Bài 5: Lấy category có sản phẩm đắt nhất trên 5 triệu
SELECT category, MAX(price) AS max_price
FROM products
GROUP BY category
HAVING MAX(price) > 5000000;


-- =========================================
-- 10. TRANSACTION: BEGIN, COMMIT, ROLLBACK
-- =========================================

-- Bài 1: Thử update rồi COMMIT
BEGIN;

UPDATE products
SET quantity = quantity - 1
WHERE name = 'Laptop Dell';

COMMIT;

-- Bài 2: Thử update rồi ROLLBACK
BEGIN;

UPDATE products
SET price = 999999999
WHERE name = 'Laptop Dell';

ROLLBACK;

-- Bài 3: Thêm sản phẩm rồi COMMIT
BEGIN;

INSERT INTO products (name, category, price, quantity)
VALUES ('Tablet Samsung', 'Electronics', 7000000, 6);

COMMIT;

-- Bài 4: Xóa sản phẩm rồi ROLLBACK
BEGIN;

DELETE FROM products
WHERE name = 'Tablet Samsung';

ROLLBACK;

-- Bài 5: Chuyển 5 quantity từ Laptop Dell sang Mouse Logitech
BEGIN;

UPDATE products
SET quantity = quantity - 5
WHERE name = 'Laptop Dell';

UPDATE products
SET quantity = quantity + 5
WHERE name = 'Mouse Logitech';

COMMIT;


-- =========================================
-- 11. INDEX và EXPLAIN
-- =========================================

-- Bài 1: Xem query plan khi lọc theo category
EXPLAIN
SELECT * FROM products
WHERE category = 'Electronics';

-- Bài 2: Tạo index cho category
CREATE INDEX idx_products_category
ON products(category);

-- Bài 3: Xem lại query plan sau khi tạo index
EXPLAIN
SELECT * FROM products
WHERE category = 'Electronics';

-- Bài 4: Tạo index cho price
CREATE INDEX idx_products_price
ON products(price);

-- Bài 5: Xem query plan khi lọc price
EXPLAIN
SELECT * FROM products
WHERE price > 1000000;


-- =========================================
-- 12. ÔN TẬP TỔNG HỢP
-- =========================================

-- Bài 1: Lấy 5 sản phẩm có tổng giá trị tồn kho cao nhất
SELECT name, category, price, quantity, price * quantity AS total_value
FROM products
ORDER BY total_value DESC
LIMIT 5;

-- Bài 2: Tìm sản phẩm trong Electronics có giá cao nhất
SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 1;

-- Bài 3: Tìm category có tổng giá trị tồn kho cao nhất
SELECT category, SUM(price * quantity) AS total_value
FROM products
GROUP BY category
ORDER BY total_value DESC
LIMIT 1;

-- Bài 4: Tìm các sản phẩm sắp hết hàng, quantity dưới 10
SELECT *
FROM products
WHERE quantity < 10
ORDER BY quantity ASC;

-- Bài 5: Tìm sản phẩm có giá trên trung bình toàn kho
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);