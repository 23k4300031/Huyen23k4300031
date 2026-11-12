# ĐỀ XUẤT DỰ ÁN: NỀN TẢNG VÉ SỰ KIỆN CHỐNG ĐẦU CƠ (EVENT TICKETING DAPP)
## Đề tài: Ứng dụng vé sự kiện âm nhạc (Case study: Concert BigBang tại Hà Nội)

## 1. Bối cảnh và Bài toán thực tế
- **Thực trạng từ sự kiện thực tế:** Sức hút từ các sự kiện âm nhạc tầm cỡ quốc tế như các buổi concert lớn của nhóm nhạc huyền thoại **BigBang tại Hà Nội** luôn thu hút lượng lớn khán giả tham gia. 
- **Vấn đề đầu cơ & lừa đảo (Scalping & Fraud):** Ngay khi vé mở bán, "phe vé" sử dụng bot hoặc gom số lượng lớn để đẩy giá lên nhiều lần so với giá gốc. Đồng thời, xuất hiện tình trạng rao bán vé giả hoặc bán một vé cho nhiều người trên mạng xã hội.
- **Hạn chế của hệ thống cũ:** Các nền tảng phát hành vé tập trung không kiểm soát được dòng tiền chuyển nhượng thứ cấp, không giới hạn được mức trần giá bán lại và thiếu cơ chế định danh minh bạch cho người sở hữu.

## 2. Giải pháp ứng dụng Blockchain
- Sử dụng hợp đồng thông minh (Smart Contract) trên nền tảng blockchain để số hóa vé dưới dạng tài sản độc quyền (chuẩn NFT / token định danh).
- Mọi lịch sử phát hành, mua bán và chuyển nhượng vé được ghi nhận công khai, minh bạch, đảm bảo không thể làm giả.

## 3. Các tính năng và Luồng cốt lõi (Core Workflow)
1. **Mua vé sơ cấp (Primary Sale):** Ban tổ chức mở bán vé trực tiếp với mức giá niêm yết cố định. Người mua thanh toán và nhận vé gốc trực tiếp về ví cá nhân.
2. **Chuyển nhượng giới hạn chống đầu cơ (Anti-Scalping Resale):** Khi người mua không thể tham gia và muốn nhượng lại vé, hợp đồng thông minh tự động áp dụng **trần giá (Max Resale Price)** – giá bán lại tối đa không vượt quá mức quy định so với giá gốc, triệt tiêu mục đích kiếm lời của phe vé.
3. **Check-in một lần tại cửa (One-time Check-in):** Nhân viên kiểm soát sự kiện quét mã vé tại cổng, smart contract cập nhật trạng thái `isCheckedIn = true`, ngăn chặn tuyệt đối việc tái sử dụng hoặc dùng ảnh chụp màn hình vé cũ để vào cửa.

## 4. Công nghệ dự kiến
- **Ngôn ngữ lập trình:** Solidity (^0.8.20)
- **Môi trường & Công cụ:** Remix IDE, MetaMask, Mạng thử nghiệm Sepolia Testnet.
- **Thư viện chuẩn:** OpenZeppelin (ERC-721 / quản lý tài sản độc quyền).