CREATE DATABASE DHSD;
USE DHSD;
CREATE TABLE DonHang (

    ma_don_hang INT,

    ma_khach_hang INT,

    ngay_dat_hang DATE,

    tong_gia_tri DECIMAL(12, 2)

);

 

-- Chèn dữ liệu mẫu

INSERT INTO DonHang (ma_don_hang, ma_khach_hang, ngay_dat_hang, tong_gia_tri) VALUES

(1, 101, '2023-01-20', 350000.00),

(2, 102, '2023-02-10', 1250000.00),

(3, 103, '2023-02-15', 180000.00),

(4, 101, '2023-03-05', 450000.00),

(5, 104, '2023-03-22', 850000.00),

(6, 102, '2023-04-11', 980000.00),

(7, 105, '2023-04-18', 250000.00),

(8, 101, '2023-05-25', 220000.00),

(9, 103, '2023-06-01', 320000.00),

(10, 104, '2023-06-30', 1500000.00),

(11, 102, '2023-07-14', 750000.00),

(12, 101, '2023-08-09', 650000.00),

(13, 106, '2023-09-01', 2800000.00),

(14, 103, '2023-09-20', 250000.00),

(15, 102, '2023-10-10', 1150000.00),

(16, 104, '2023-11-05', 450000.00),

(17, 101, '2023-11-28', 150000.00),

(18, 102, '2023-12-15', 2100000.00);

SELECT  ma_khach_hang ,SUM(tong_gia_tri) AS tong_chi_tieu,COUNT(*) AS tong_so_don_hang, AVG(tong_gia_tri) AS chi_tieu_trung_binh, MIN( ngay_dat_hang) AS ngay_dau_tien, MAX(ngay_dat_hang) AS ngay_gan_nhat
FROM DonHang 
GROUP BY ma_khach_hang 
ORDER BY tong_chi_tieu DESC;

 /*
BƯỚC 2: THIẾT KẾ HỆ THỐNG PHÂN HẠNG KHÁCH HÀNG

 HẠNG BẠC

Tiêu chí:
- tong_chi_tieu >= 500,000 VND
- AND tong_so_don_hang >= 2

Lý do:
- Dữ liệu cho thấy khách dưới 500k thường chỉ mua 1 lần → chưa đủ tiêu chuẩn để gọi là “khách thân thiết”.

Quyền lợi:
1) Giảm 4% cho mọi đơn hàng.
2) Tích điểm đổi quà theo chương trình chuẩn.
 HẠNG VÀNG
Tiêu chí:
- tong_chi_tieu >= 1,500,000 VND
- AND tong_so_don_hang >= 3
- AND (ngay_gan_nhat >= '2023-07-01')  -- còn hoạt động gần đây

Lý do:
- Điều kiện “gần đây còn mua” giúp phân biệt khách hoạt động và khách ngủ đông.

Quyền lợi:
1) Giảm 7% cho tất cả đơn hàng.
2) Miễn phí vận chuyển 3 lần/tháng.
3) Quà sinh nhật (voucher 50k).
 HẠNG BẠCH KIM
Tiêu chí:
- tong_chi_tieu >= 3,000,000 VND
- AND tong_so_don_hang >= 4
- AND chi_tieu_trung_binh >= 500,000 VND  -- chất lượng đơn hàng cao
- AND (ngay_gan_nhat >= '2023-09-01')      -- cực kỳ tích cực gần đây

Lý do:
- Những khách này không chỉ chi nhiều mà còn mua đều .

Quyền lợi:
1) Giảm 12% toàn bộ đơn hàng.
2) Miễn phí vận chuyển không giới hạn.
3) Bộ quà VIP hằng năm.
🧠 LẬP LUẬN CHUNG

1. Các ngưỡng được chọn dựa trên phân bổ chi tiêu thực tế:
   • Nhóm top chi tiêu > 3,000,000 rất rõ ràng.  
   • Nhóm trung bình 1–3 triệu tương đối đông và ổn định.  
2. Việc kết hợp nhiều tiêu chí (tần suất, chi tiêu trung bình, hoạt động gần đây)
   giúp chương trình:
   • Công bằng (không chỉ xét ai mua 1 đơn lớn)  
   • Khuyến khích hành vi lặp lại  
3. Quyền lợi tăng theo cấp độ giúp:
   • Khách hạng thấp phấn đấu lên hạng cao  
   • Hạng cao cảm thấy “đặc quyền” và gắn bó hơn  

4. Mô hình phân hạng này phù hợp để áp dụng thực tế vì:
   • Dễ đo lường  
   • Công bằng  
*/