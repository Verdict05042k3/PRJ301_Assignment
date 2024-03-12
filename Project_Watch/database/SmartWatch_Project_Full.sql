Create database SmartWatch_Project
Go
use SmartWatch_Project
Go

DROP database SmartWatch_Project
go
-- Bảng Thương hiệu
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);
Go
-- Bảng Người dùng
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) UNIQUE NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    phone_number NVARCHAR(20),
    [role] NVARCHAR(10) NOT NULL DEFAULT 'user' CHECK ([role] IN ('user', 'admin'))
);
GO
-- Bảng Sản phẩm
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    brand_id INT,
    price MONEY,
    description NVARCHAR(MAX),
    quantity INT NOT NULL,
    image_url NVARCHAR(255),
    old_price MONEY,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);
GO
-- Bảng Đơn đặt hàng
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    order_date DATE NOT NULL,
	address NVARCHAR(255) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
	Status INT NOT NULL, -- 1: Completed, 2: processing, 0: Cancelled
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

GO

-- Bảng Chi tiết đơn đặt hàng
CREATE TABLE OrderDetails (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
	PRIMARY KEY (order_id, product_id)
);




INSERT INTO Users (username, password, email, full_name, address, phone_number, role) VALUES
('user1', '1', 'user1@gmail.com', 'User', '123 Main St, City, Country', '123456789', 'user'),
('admin1', '1', 'admin1@gmail.com', 'Admin ', '456 Admin Blvd, City, Country', '987654321', 'admin');
Go

INSERT INTO Brands (name) VALUES
('Apple'),
('Samsung'),
('Xiaomi'),
('Huawei')
Go


INSERT INTO Products (name, brand_id, price, description, quantity, image_url, old_price)
VALUES (N'Apple Watch Series 8 45mm GPS viền nhôm', 1, 8690000, N'Apple Watch Series 8 45mm GPS viền nhôm: Thiết kế thời trang, tích hợp GPS, cảm biến sức khỏe và tính năng thông minh, giúp bạn theo dõi hoạt động và thông báo một cách thuận tiện.', 10, 'apple_gps_2_.webp', 12990000),
 (N'Apple Watch Ultra 49mm viền Titan dây cao su', 1, 17490000, N'Apple Watch Ultra 49mm Viền Titan dây cao su: Thiết kế sang trọng với viền Titan bền bỉ, dây cao su linh hoạt. Đồng hồ thông minh tiên tiến với các tính năng sức khỏe và thông báo thông minh, phục vụ nhu cầu hoạt động hàng ngày của bạn.', 5, 'apple_gps_10_.webp', 23990000),
 (N'Apple Watch Series 9 45mm viền nhôm dây cao su', 1, 13690000, N'Apple Watch Series 9 45mm viền nhôm dây cao su: Thiết kế đẹp mắt, viền nhôm bền bỉ kết hợp với dây cao su linh hoạt. Đồng hồ thông minh tiên tiến, phục vụ nhu cầu hàng ngày của bạn.', 4, 'apple_lte_2__1_4.webp', 13890000),
 (N'Apple Watch Ultra 49mm viền thiếp dây thép', 1, 19390000, N'Apple Watch Ultra 49mm Viền thép dây thép: Thiết kế sang trọng, viền thép bền bỉ kết hợp với dây đeo thép cao cấp. Đồng hồ thông minh tiên tiến, đồng hành đáng tin cậy trong mọi hoạt động.', 7, 'apple_lte_2__2.webp', 20290000),
 (N'Apple Watch Ultra 45mm viền nhôm dây cao su ', 1, 10690000, N'Mô tả sản phẩm', 8, 'apple_lte_3__1.webp', 23990000),
 (N'Apple Watch Series 9 41mm viền nhôm dây cao su', 1, 5900000, N'Mô tả sản phẩm', 10, 'apple_lte_4__1.webp', 6300000),
 (N'Apple Watch Series 9 45mm viền thép dây thép', 1, 20190000, N'Mô tả sản phẩm', 12, 'apple_lte_4__2.webp', 21190000),
 (N'Apple Watch Series 8 41mm 4G viền nhôm dây cao su', 1, 8990000, N'Mô tả sản phẩm', 15, 'apple_lte_5_.webp', 14990000),
 (N'Apple Watch Ultra 49MM (4G) - Viền Titan Dây Vải Cỡ Nhỏ', 1, 16490000, N'Mô tả sản phẩm', 10, 'apple_lte_17_.webp', 23990000),
 (N'Apple Watch SE 2 2023 44mm (4G) viền nhôm ', 1, 7790000, N'Mô tả sản phẩm', 3, 'apple_watch_se_1_3.webp', 8490000),
 (N'Apple Watch Ultra 2 49mm (4G) dây cao su ', 1, 20990000, N'Mô tả sản phẩm', 2, 'apple_watch_ultra_2.webp', 21990000),
 (N'Apple Watch SE 2 2023 40mm (GPS) viền nhôm', 1, 5790000, N'Mô tả sản phẩm', 4, 'apple-watch-se-2023-40mm.webp', 6390000),
 (N'Vòng đeo tay thông minh Huawei Band 8', 4, 890000, N'Mô tả sản phẩm', 7, 'band_8.webp', 1090000),
 (N'Vòng đeo tay thông minh Xiaomi Mi Band 8 Active', 3, 550000, N'Mô tả sản phẩm', 3, 'band_8_active.webp', 690000),
 (N'Đồng hồ thông minh Xiaomi Redmi Watch 2 Lite', 3, 890000, N'Mô tả sản phẩm', 6, 'dong_ho_xiaomi.webp', 1490000),
 (N'Đồng hồ thông minh Huawei Watch GT4 dây silicone', 4, 4990000, N'Mô tả sản phẩm', 3, 'dong-ho-thong-minh-huawei-watch-gt-4-day-silicone-thumb.webp', 5990000),
 (N'Đồng hồ thông minh Huawei Watch GT Cyber viền thép', 4, 3990000, N'Mô tả sản phẩm', 5, 'gt_cyber_1_1.webp', 6490000),
 (N'Đồng hồ thông minh Huawei Watch GT3 Pro dây silicone', 4, 7290000, N'Mô tả sản phẩm', 8, 'huawei_1_.webp', 8490000),
 (N'Đồng hồ thông minh Huawei Watch GT4 dây thép', 4, 8490000, N'Mô tả sản phẩm', 12, 'huawei_1__1_1.webp', 9490000),
 (N'Đồng hồ thông minh Huawei Watch 4', 4, 9990000, N'Mô tả sản phẩm', 2, 'huawei_1_6.webp', 11990000),
 (N'Đồng hồ thông minh Huawei Watch GT4 46mm dây Composite', 4, 5490000, N'Mô tả sản phẩm', 2, 'huawei_2__1_1.webp', 6490000),
 (N'Đồng hồ thông minh Huawei Watch GT4 dây da', 4, 5790000, N'Mô tả sản phẩm', 2, 'huawei_3__1_1.webp', 6990000),
 (N'Đồng hồ thông minh Huawei Watch GT3 Pro dây da', 4, 7690000, N'Mô tả sản phẩm', 9, 'huawei_5_.webp', 8990000),
 (N'Đồng hồ thông minh Huawei Watch Kids 4 Pro', 4, 2790000, N'Mô tả sản phẩm', 5, 'huawei_14_.webp', 3490000),
 (N'Đồng hồ thông minh Huawei Watch Fit 2', 4, 2490000, N'Mô tả sản phẩm', 6, 'huawei_watch_fit.webp', 3290000),
 (N'Đồng hồ thông minh Huawei Watch Ultimate', 4, 19990000, N'Mô tả sản phẩm', 3, 'huawei_watch_ultimate.png', 21000000),
 (N'Vòng đeo tay thông minh Xiaomi Mi Band 8', 3, 790000, N'Mô tả sản phẩm', 7, 'mi_band_7.webp', 990000),
 (N'Đồng hồ Samsung Galaxy Fit 3', 2, 1390000, N'Mô tả sản phẩm', 2, 'samsung_3.webp', 1490000),
 (N'Samsung Galaxy Watch5 Pro', 2, 5490000, N'Mô tả sản phẩm', 13, 'sansung_2__2.webp', 11990000),
 (N'Samsung Galaxy Watch4', 2, 3990000, N'Mô tả sản phẩm', 5, 'sansung_3__2.webp', 6990000),
 (N'Samsung Galaxy Watch4 Classic 46mm', 2, 3990000, N'Mô tả sản phẩm', 3, 'sansung_4__1.webp', 8990000),
 (N'Samsung Galaxy Watch4 40mm', 2, 3990000, N'Mô tả sản phẩm', 8, 'sansung_5_.webp', 7900000),
 (N'Samsung Galaxy Watch6 Classic 47mm Bluetooth', 2, 7550000, N'Mô tả sản phẩm', 1, 'watch6_classic_thumbnail.webp', 9490000),
 (N'Samsung Galaxy Watch6 40mm Bluetooth', 2, 5490000, N'Mô tả sản phẩm', 2, 'watch6_classic_thumbnail.webp', 7490000),
 (N'Đồng hồ thông minh Xiaomi Watch S1 Active', 3, 2290000, N'MXiaomi Watch S1 Active là một đồng hồ thông minh đa chức năng, với màn hình lớn, theo dõi hoạt động thể chất và sức khỏe, tích hợp các tính năng thông minh như thông báo từ điện thoại và chống nước.', 9, 'xiaomi_1_6.webp', 4490000),
 (N'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active', 3, 1090000, N'Mô tả sản phẩm', 12, 'xiaomi_1_7.webp', 1490000),
 (N'Vòng đeo tay thông minh Xiaomi Mi Band 8', 3, 790000, N'Mô tả sản phẩm', 1, 'xiaomi_2_1.webp', 990000),
 (N'Đồng hồ thông minh Xiaomi Mi Watch', 3, 1390000, N'Mô tả sản phẩm', 12, 'xiaomi_watch_1.webp', 3490000),
 (N'Đồng hồ thông minh Xiaomi Redmi Watch 4', 3, 2690000, N'Mô tả sản phẩm', 4, 'xiaomiii.webp', 3120000),
 (N'Đồng hồ thông minh Xiaomi Haylou LS01', 3, 1300000, N'Mô tả sản phẩm', 6, 'haylou.webp', 2120000)
Go

select * from [dbo].[Products]