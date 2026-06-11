-- =========================================
-- 1. SELECT: lấy dữ liệu
-- =========================================

-- Bài 1: Lấy tất cả sản phẩm

-- Bài 2: Lấy name và price của tất cả sản phẩm

-- Bài 3: Đổi tên cột name thành product_name

-- Bài 4: Tính tổng giá trị tồn kho của từng sản phẩm = price * quantity

-- Bài 5: Lấy category không trùng nhau


-- =========================================
-- 2. WHERE: lọc dữ liệu
-- =========================================

-- Bài 1: Lấy sản phẩm có giá lớn hơn 1 triệu

-- Bài 2: Lấy sản phẩm thuộc category Electronics

-- Bài 3: Lấy sản phẩm có quantity nhỏ hơn hoặc bằng 10

-- Bài 4: Lấy sản phẩm giá từ 100k đến 2 triệu

-- Bài 5: Lấy sản phẩm có tên chứa chữ "o"


-- =========================================
-- 3. AND, OR, IN
-- =========================================

-- Bài 1: Lấy sản phẩm Electronics và giá trên 20 triệu

-- Bài 2: Lấy sản phẩm Furniture hoặc Lifestyle

-- Bài 3: Viết lại bài 2 bằng IN

-- Bài 4: Lấy sản phẩm category Accessories và quantity > 20

-- Bài 5: Lấy sản phẩm giá dưới 100k hoặc quantity trên 100


-- =========================================
-- 4. ORDER BY, LIMIT, OFFSET
-- =========================================

-- Bài 1: Sắp xếp sản phẩm theo giá tăng dần

-- Bài 2: Sắp xếp sản phẩm theo giá giảm dần

-- Bài 3: Lấy 3 sản phẩm đắt nhất

-- Bài 4: Lấy 5 sản phẩm có quantity nhiều nhất

-- Bài 5: Phân trang: bỏ qua 5 dòng đầu, lấy 5 dòng tiếp theo


-- =========================================
-- 5. INSERT
-- =========================================

-- Bài 1: Thêm một sản phẩm mới

-- Bài 2: Thêm sản phẩm và trả về dòng vừa thêm

-- Bài 3: Thêm 2 sản phẩm cùng lúc

-- Bài 4: Thêm sản phẩm quantity = 0

-- Bài 5: Thêm sản phẩm Lifestyle


-- =========================================
-- 6. UPDATE
-- =========================================

-- Bài 1: Tăng giá Mouse Logitech lên 400000

-- Bài 2: Giảm quantity của iPhone 15 đi 1

-- Bài 3: Tăng giá tất cả sản phẩm Stationery thêm 10%

-- Bài 4: Đổi category của USB 32GB thành Storage

-- Bài 5: Set quantity = 100 cho sản phẩm có quantity = 0


-- =========================================
-- 7. DELETE
-- =========================================

-- Bài 1: Xóa sản phẩm tên Ruler

-- Bài 2: Xóa sản phẩm có quantity = 0

-- Bài 3: Xóa sản phẩm giá dưới 10000

-- Bài 4: Xóa sản phẩm category Storage

-- Bài 5: Xóa sản phẩm có id lớn hơn 100


-- =========================================
-- 8. GROUP BY, COUNT, SUM, AVG, MIN, MAX
-- =========================================

-- Bài 1: Đếm số sản phẩm theo từng category

-- Bài 2: Tính tổng quantity theo từng category

-- Bài 3: Tính giá trung bình theo từng category

-- Bài 4: Tìm giá thấp nhất và cao nhất trong từng category

-- Bài 5: Tính tổng giá trị tồn kho theo từng category


-- =========================================
-- 9. HAVING
-- =========================================

-- Bài 1: Lấy category có hơn 1 sản phẩm

-- Bài 2: Lấy category có tổng quantity trên 50

-- Bài 3: Lấy category có giá trung bình trên 1 triệu

-- Bài 4: Lấy category có tổng tồn kho trên 10 triệu

-- Bài 5: Lấy category có sản phẩm đắt nhất trên 5 triệu


-- =========================================
-- 10. TRANSACTION: BEGIN, COMMIT, ROLLBACK
-- =========================================

-- Bài 1: Thử update rồi COMMIT

-- Bài 2: Thử update rồi ROLLBACK

-- Bài 3: Thêm sản phẩm rồi COMMIT

-- Bài 4: Xóa sản phẩm rồi ROLLBACK

-- Bài 5: Chuyển 5 quantity từ Laptop Dell sang Mouse Logitech


-- =========================================
-- 11. INDEX và EXPLAIN
-- =========================================

-- Bài 1: Xem query plan khi lọc theo category

-- Bài 2: Tạo index cho category

-- Bài 3: Xem lại query plan sau khi tạo index

-- Bài 4: Tạo index cho price

-- Bài 5: Xem query plan khi lọc price


-- =========================================
-- 12. ÔN TẬP TỔNG HỢP
-- =========================================

-- Bài 1: Lấy 5 sản phẩm có tổng giá trị tồn kho cao nhất

-- Bài 2: Tìm sản phẩm trong Electronics có giá cao nhất

-- Bài 3: Tìm category có tổng giá trị tồn kho cao nhất

-- Bài 4: Tìm các sản phẩm sắp hết hàng, quantity dưới 10

-- Bài 5: Tìm sản phẩm có giá trên trung bình toàn kho