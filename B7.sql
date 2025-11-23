CREATE DATABASE CTDH;
USE CTDH;
CREATE TABLE ChiTietDonHang (

    ma_chi_tiet INT,

    ma_don_hang INT,

    ten_san_pham VARCHAR(100),

    so_luong INT,

    don_gia DECIMAL(10, 2),

    thanh_tien DECIMAL(10, 2)

);

 

-- Chèn dữ liệu mẫu

INSERT INTO ChiTietDonHang (ma_chi_tiet, ma_don_hang, ten_san_pham, so_luong, don_gia, thanh_tien) VALUES

(1, 1001, 'Cà Phê Sữa', 2, 29000.00, 58000.00),

(2, 1001, 'Bạc Xỉu', 1, 35000.00, 35000.00),

(3, 1002, 'Trà Đào Cam Sả', 1, 45000.00, 45000.00),

(4, 1003, 'Cà Phê Sữa', 1, 29000.00, 29000.00),

(5, 1004, 'Trà Sữa Trân Châu Đường Đen', 2, 55000.00, 110000.00),

(6, 1005, 'Bạc Xỉu', 1, 35000.00, 35000.00),

(7, 1006, 'Cà Phê Sữa', 3, 29000.00, 87000.00),

(8, 1006, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00),

(9, 1007, 'Trà Đào Cam Sả', 2, 45000.00, 90000.00),

(10, 1008, 'Trà Sữa Trân Châu Đường Đen', 1, 55000.00, 55000.00),

(11, 1009, 'Cà Phê Sữa', 1, 29000.00, 29000.00),

(12, 1010, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00);
SELECT ten_san_pham, SUM(so_luong) AS tong_so_ly_ban, SUM(thanh_tien) AS tong_doanh_thu, COUNT(DISTINCT(ma_don_hang)) AS so_don_hang_chua_sp
GROUP BY ten_san_pham;
/* Nhiệm vụ 2: Phân tích và Đề xuất Chiến lược

Phân loại sản phẩm:
- 2 sản phẩm "ngôi sao" (hiệu suất tốt nhất):
    1) Cà Phê Sữa
    2) Trà Sữa Trân Châu Đường Đen

- 2 sản phẩm "cần xem xét" (hiệu suất thấp nhất):
    1) Bạc Xỉu
    2) Trà Chanh Gừng Mật Ong

Lập luận (dựa trên kết quả báo cáo):
- Cà Phê Sữa:
    + Tổng doanh thu cao nhất (203,000) và tổng số ly bán lớn (7 ly), xuất hiện trong nhiều đơn hàng (4 đơn) .
    + Đây là sản phẩm chủ lực.

- Trà Sữa Trân Châu Đường Đen:
    + Doanh thu thứ nhì (165,000) với số lượng ly bán và số đơn hàng khá đều (tương đối phổ biến).
    + Đây là sản phẩm "hot" về doanh thu.

- Bạc Xỉu:
    +Doanh thu thấp nhất (70,000) và xuất hiện chỉ trong 2 đơn hàng .
    + Có thể do vị không hợp khẩu vị chính khách hàng hiện tại.

- Trà Chanh Gừng Mật Ong:
    + Doanh thu thấp (84,000) chỉ 2 đơn, số ly ít (2 ly).
    + Mức độ phổ biến thấp dù giá trung bình khá.

Đề xuất chiến lược (hành động cụ thể):

1) Đối với một sản phẩm "ngôi sao" — Cà Phê Sữa:
   - Chương trình khuyến mãi: "Combo Cà Phê Sữa + Bánh" trong giờ vàng (10h-14h) giảm 15% khi mua combo.
    

2) Đối với một sản phẩm "cần xem xét" — **Bạc Xỉu**:
   - Hành động thử nghiệm: thử **giảm giá dùng thử 20%** trong 2 tuần, kết hợp với vị trí hiển thị nổi bật (menu, poster).
   - Thu thập feedback: kèm mẫu khảo sát ngắn (QR code) để hiểu lý do khách không mua (giá/khẩu vị/portion).
  
3) Đối với sản phẩm "cần xem xét" — **Trà Chanh Gừng Mật Ong**:
   - Hành động nhẹ nhàng: đưa vào chương trình "Đặc sắc mùa" (nếu phù hợp theo mùa) + giảm giá thử 10% cho khách hàng lần đầu mua.
   - Kiểm tra hiển thị: đảm bảo sản phẩm không bị ẩn trong menu; đưa hình ảnh hấp dẫn, highlight lợi ích (giảm stress, thanh nhiệt).
   
