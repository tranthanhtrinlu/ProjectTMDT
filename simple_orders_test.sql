-- Simple test data for orders table (auto-increment ID)

INSERT INTO orders (user_id, total_price, receiver_name, receiver_address, receiver_phone, status, payment_ref, payment_status, payment_method, created_at) VALUES

-- Completed orders
(1, 2500000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'COMPLETE', 'PAY_001', 'PAYMENT_SUCCEED', 'VNPAY', '2024-01-15 10:30:00'),
(2, 1800000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'COMPLETE', 'PAY_002', 'PAYMENT_SUCCEED', 'COD', '2024-01-16 14:20:00'),
(1, 3200000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'COMPLETE', 'PAY_003', 'PAYMENT_SUCCEED', 'VNPAY', '2024-01-17 09:15:00'),
(3, 4500000, 'Lê Văn C', '789 Đồng Khởi, Q1, TP.HCM', '0903456789', 'COMPLETE', 'PAY_004', 'PAYMENT_SUCCEED', 'VNPAY', '2024-01-20 16:45:00'),

-- Shipping orders
(1, 1500000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'SHIPPING', 'PAY_005', 'PAYMENT_SUCCEED', 'VNPAY', '2024-12-20 16:45:00'),
(2, 2200000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'SHIPPING', 'PAY_006', 'PAYMENT_SUCCEED', 'COD', '2024-12-21 13:00:00'),

-- Confirmed orders
(1, 1900000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'CONFIRMED', 'PAY_007', 'PAYMENT_SUCCEED', 'COD', '2024-12-23 15:20:00'),
(2, 2600000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'CONFIRMED', 'PAY_008', 'PAYMENT_SUCCEED', 'VNPAY', '2024-12-24 12:10:00'),

-- Pending orders
(1, 1200000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'PENDING', 'PAY_009', 'PAYMENT_PENDING', 'COD', '2024-12-26 14:30:00'),
(2, 3500000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'PENDING', 'PAY_010', 'PAYMENT_SUCCEED', 'VNPAY', '2024-12-26 17:15:00'),

-- Cancelled orders
(1, 1700000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'CANCEL', 'PAY_011', 'PAYMENT_CANCEL', 'COD', '2024-12-25 14:30:00'),
(3, 1400000, 'Lê Văn C', '789 Đồng Khởi, Q1, TP.HCM', '0903456789', 'CANCEL', 'PAY_012', 'PAYMENT_TIMEOUT', 'VNPAY', '2024-12-23 17:30:00'),

-- Recent orders
(1, 4200000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'COMPLETE', 'PAY_013', 'PAYMENT_SUCCEED', 'VNPAY', DATE_SUB(NOW(), INTERVAL 2 DAY)),
(2, 2900000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'SHIPPING', 'PAY_014', 'PAYMENT_SUCCEED', 'COD', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(3, 3600000, 'Lê Văn C', '789 Đồng Khởi, Q1, TP.HCM', '0903456789', 'CONFIRMED', 'PAY_015', 'PAYMENT_SUCCEED', 'VNPAY', NOW()),

-- High value orders
(1, 8500000, 'Nguyễn Văn A', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'COMPLETE', 'PAY_016', 'PAYMENT_SUCCEED', 'VNPAY', '2024-01-26 09:30:00'),
(2, 7200000, 'Trần Thị B', '456 Nguyễn Huệ, Q1, TP.HCM', '0902345678', 'COMPLETE', 'PAY_017', 'PAYMENT_SUCCEED', 'COD', '2024-01-27 16:15:00'),

-- Update some products with sold quantities for testing best-sellers
UPDATE products SET sold = 150 WHERE id <= 5;
UPDATE products SET sold = 120 WHERE id > 5 AND id <= 10;

-- Simple verification
SELECT 'Test orders created successfully!' as status;
SELECT COUNT(*) as total_orders FROM orders;
SELECT status, COUNT(*) as count FROM orders GROUP BY status; 