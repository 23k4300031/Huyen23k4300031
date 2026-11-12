# BÁO CÁO RÀ SOÁT MÃ NGUỒN (AUDIT REPORT)
## Đề tài: Nền tảng Vé sự kiện Concert BigBang tại Hà Nội (`EventTicket.sol`)

## Tóm tắt
- **Nhóm rà soát:** Nhóm 5
- **Đối tượng rà soát:** Hợp đồng thông minh `EventTicket.sol` (tổng cộng [Điền tổng số dòng] dòng)
- **Phạm vi kiểm tra:** 10 hạng mục rà soát bắt buộc.
- **Kết quả tổng quan:** Đã rà soát toàn bộ mã nguồn chính, phát hiện tổng cộng **1 vấn đề nhẹ** (0 nghiêm trọng, 0 trung bình). Hợp đồng tuân thủ đúng nguyên tắc Checks-Effects-Interactions và chuẩn OpenZeppelin v5.

---

## Chi tiết phát hiện

### Phát hiện 1 - Thiếu kiểm tra tham số địa chỉ rỗng (`address(0)`) khi cấp phát vé
- **Mức độ:** Nhẹ
- **Vị trí:** Dòng [Điền số dòng], hàm `issueTo` (hoặc `constructor`)
- **Mô tả:** Khi thực hiện thao tác cấp phát vé miễn phí hoặc cấu hình địa chỉ quản trị, hàm chưa có bước kiểm tra địa chỉ nhận đầu vào có khác `address(0)` hay không.
- **Tình huống gây thiệt hại:** Nếu ban tổ chức nhập nhầm địa chỉ rỗng khi cấp vé mời, vé sẽ bị gửi vào địa chỉ vô chủ và không thể thu hồi hay sử dụng lại.
- **Khuyến nghị:** Bổ sung kiểm tra `if (to == address(0)) revert InvalidAddress();` ở đầu hàm.
- **Ai phát hiện:** Thành viên nhóm

---

## Bảng đối chiếu 10 hạng mục rà soát bắt buộc

| # | Hạng mục kiểm tra | Trạng thái | Ghi chú / Chi tiết |
|---|---|---|---|
| 1 | **Phân quyền (Access Control)** | Đạt | Các hàm nhạy cảm (`issueTo`, `checkIn`, `withdraw`) đều có gắn `onlyOwner`. |
| 2 | **Thứ tự thao tác (Checks-Effects-Interactions)** | Đạt | Tuân thủ đúng thứ tự kiểm tra, cập nhật trạng thái trước khi chuyển tiền trong hàm `withdraw`. |
| 3 | **Điều kiện thời gian** | Đạt | Các điều kiện kiểm tra thời gian rõ ràng, không bị ngược dấu so sánh. |
| 4 | **Phép chia** | Đạt | Không có phép chia số nguyên gây làm tròn xuống về 0 làm sai lệch giá vé. |
| 5 | **Cách chuyển ETH** | Đạt | Dùng `.call{value: amount}("")` và có `require(ok)` kiểm tra kết quả trả về. |
| 6 | **Dữ liệu riêng tư (`private`)** | Đạt | Không lưu dữ liệu mật nhạy cảm bằng biến `private` trên chuỗi. |
| 7 | **Vòng lặp** | Đạt | Không có vòng lặp trên mảng động gây nguy cơ vượt giới hạn gas. |
| 8 | **Sự kiện (Events)** | Đạt | Các thao tác thay đổi trạng thái quan trọng (`TicketMinted`, `TicketUsed`) đều phát sự kiện. |
| 9 | **Trường hợp số 0** | Đạt | Đã xử lý kiểm tra giá vé và chặn thao tác với vé không tồn tại. |
| 10 | **Địa chỉ rỗng (`address(0)`)** | Cần lưu ý | Đã nêu khuyến nghị bổ sung kiểm tra ở Phát hiện 1. |