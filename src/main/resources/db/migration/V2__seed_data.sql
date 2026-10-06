-- Mat khau cua ca 3 tai khoan: 123456
INSERT INTO users (id, full_name, email, password_hash, phone, role) VALUES
(1, 'Quản trị viên', 'admin@sannha.vn', '$2a$10$MwfBMufggUZ4GRVfTcJQc.6KrifiFaIYlMJL8UIRcfY8IrD8A.S4a', '0900000001', 'ADMIN'),
(2, 'Nguyễn Văn Chủ', 'owner@sannha.vn', '$2a$10$MwfBMufggUZ4GRVfTcJQc.6KrifiFaIYlMJL8UIRcfY8IrD8A.S4a', '0900000002', 'OWNER'),
(3, 'Trần Thị Khách', 'khach@sannha.vn', '$2a$10$MwfBMufggUZ4GRVfTcJQc.6KrifiFaIYlMJL8UIRcfY8IrD8A.S4a', '0900000003', 'CUSTOMER');

INSERT INTO venues (id, owner_id, name, address, district, description) VALUES
(1, 2, 'Sân Bóng Thành Công', '12 Nguyễn Văn Linh', 'Quận 7', 'Cụm sân cỏ nhân tạo 5 và 7 người'),
(2, 2, 'Cầu Lông Ánh Dương', '45 Lê Văn Việt', 'Thủ Đức', 'Sân cầu lông trong nhà, có điều hòa');

INSERT INTO courts (id, venue_id, name, type, base_price_per_hour) VALUES
(1, 1, 'Sân 5 người A', 'FOOTBALL', 300000),
(2, 1, 'Sân 7 người B', 'FOOTBALL', 500000),
(3, 2, 'Sân cầu lông 1', 'BADMINTON', 80000),
(4, 2, 'Sân cầu lông 2', 'BADMINTON', 80000);

INSERT INTO price_rules (court_id, day_type, start_hour, end_hour, price_per_hour) VALUES
(1, 'WEEKDAY', 17, 22, 400000),
(1, 'WEEKEND', 6, 22, 450000),
(2, 'WEEKDAY', 17, 22, 650000),
(2, 'WEEKEND', 6, 22, 700000),
(3, 'WEEKDAY', 17, 21, 120000),
(4, 'WEEKDAY', 17, 21, 120000);