-- =====================================================
-- SQL PRACTICE: RELATIONSHIP - JOIN - SUBQUERY
-- =====================================================

-- ==========================
-- SETUP
-- ==========================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total NUMERIC(12,2)
);

INSERT INTO users (name, email) VALUES
('Trung', 'trung@gmail.com'),
('An', 'an@gmail.com'),
('Binh', 'binh@gmail.com'),
('Lan', 'lan@gmail.com');

INSERT INTO orders (user_id, total) VALUES
(1, 500000),
(1, 700000),
(2, 300000),
(2, 1200000),
(4, 800000);


-- =====================================================
-- PHẦN A - JOIN
-- =====================================================

-- Bài 1:
-- Lấy tên user và tổng tiền của tất cả order.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 2:
-- Lấy id order, tên user và tổng tiền order.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 3:
-- Lấy tất cả order của user có tên 'Trung'.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 4:
-- Lấy các order có total > 500000 và hiển thị tên user.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 5:
-- Hiển thị email của user và tổng tiền order,
-- sắp xếp theo total giảm dần.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 6:
-- Dùng LEFT JOIN để hiển thị tất cả user và order của họ.
-- User chưa có order vẫn phải xuất hiện.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 7:
-- Dùng LEFT JOIN để tìm các user chưa từng có order.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 8:
-- Đếm số lượng order của mỗi user.
-- Hiển thị: name, total_orders.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 9:
-- Tính tổng tiền (SUM(total)) của từng user.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 10:
-- Chỉ hiển thị các user có từ 2 order trở lên.

-- Đáp án của bạn:



-- =====================================================
-- PHẦN B - SUBQUERY
-- =====================================================

-- Bài 11:
-- Lấy các order có total lớn hơn giá trị trung bình
-- của tất cả order.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 12:
-- Lấy order có giá trị lớn nhất.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 13:
-- Lấy order có giá trị nhỏ nhất.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 14:
-- Lấy tất cả order của user có id = 1
-- bằng cách dùng subquery.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 15:
-- Tìm user đã tạo order có giá trị lớn nhất.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 16:
-- Tìm các user có ít nhất một order lớn hơn 1.000.000.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 17:
-- Tìm các user chưa từng có order
-- bằng cách dùng NOT IN.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 18:
-- Tìm các order có total nhỏ hơn giá trị trung bình
-- của tất cả order.

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 19:
-- Tìm user có tổng số tiền order lớn nhất.
-- (Gợi ý: GROUP BY + subquery)

-- Đáp án của bạn:


---------------------------------------------------------

-- Bài 20:
-- Tìm user có số lượng order nhiều nhất.

-- Đáp án của bạn:



-- =====================================================
-- ===================== ĐÁP ÁN =========================
-- =====================================================