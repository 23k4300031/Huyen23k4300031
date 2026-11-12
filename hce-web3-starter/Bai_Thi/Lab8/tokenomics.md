# Quy tắc kinh tế - Vé sự kiện giới hạn bán lại (EventTicket)

## 1. Đơn vị giá trị trong hệ thống
- Phát hành vé dưới dạng tài sản số duy nhất tuân theo chuẩn ERC-721 (NFT), trong đó mỗi vé mang một định danh tokenId độc lập[cite: 67, 68].
- Tổng cung cố định: Tối đa 100 vé (maxSupply = 100) cho một sự kiện để kiểm soát sức chứa giới hạn[cite: 68].
- Người giữ ban đầu: Ban tổ chức (Owner) giữ quyền khởi tạo và phân phối vé ban đầu[cite: 68].

## 2. Nguồn thu
- Ban tổ chức thu nguồn tiền trực tiếp thông qua việc bán vé niêm yết (ví dụ: 0.01 ETH/vé)[cite: 68].
- Toàn bộ doanh thu từ tiền bán vé được lưu trữ an toàn trong hợp đồng thông minh và ban tổ chức có thể rút về ví sau khi sự kiện kết thúc thông qua hàm withdraw()[cite: 69].

## 3. Quy tắc chống lạm dụng và đầu cơ
- Trần sở hữu ví: Mỗi địa chỉ ví chỉ được phép mua tối đa 01 vé (hasTicket[msg.sender] = true) nhằm ngăn chặn tình trạng gom vé số lượng lớn để đầu cơ[cite: 68].
- Chống đầu cơ giá vé thứ cấp: Hệ thống tích hợp cơ chế kiểm soát chuyển nhượng (_update), tự động từ chối giao dịch nếu vé đó đã được sử dụng (used[tokenId] == true) hoặc vi phạm điều kiện ràng buộc chuyển nhượng[cite: 68, 69].

## 4. Quyền của người quản trị (Admin)
- Ban tổ chức nắm giữ các quyền hạn: Khởi tạo sự kiện, cấu hình giá vé, tiến hành quét vé (checkIn) tại cửa, và rút quỹ tiền bán vé[cite: 69].
- Rủi ro vận hành: Nếu người quản trị mất khóa ví hoặc có ý đồ xấu, số dư quỹ tiền trong hợp đồng có thể bị rút thông qua hàm withdraw()[cite: 69]. Do đó, thực tế đòi hỏi ví Admin phải được bảo mật nghiêm ngặt hoặc quản lý qua cơ chế đa chữ ký (multisig).

## 5. Phản biện và trả lời
- Điểm yếu 1: Rủi ro tập trung quyền lực vào ví Owner (Ban tổ chức có thể rút toàn bộ tiền bán vé bất cứ lúc nào).
  - Trả lời: Nhóm chấp nhận rủi ro này vì đây là mô hình sự kiện tập trung do ban tổ chức quản lý trực tiếp, thực tế có thể nâng cấp lên cơ chế đa chữ ký (multisig) ở các phiên bản sau.
- Điểm yếu 2: Giới hạn 1 vé/ví vẫn có thể bị lách bằng cách dùng nhiều ví phụ (Sybil attack).
  - Trả lời: Quy tắc kỹ thuật trên blockchain chỉ hạn chế được phần nào, kết hợp với việc xác thực danh tính người mua khi check-in tại cửa sự kiện.
- Điểm yếu 3: Không có cơ chế hoàn tiền (refund) tự động nếu người mua muốn trả lại vé trước sự kiện.
  - Trả lời: Quy tắc của dự án tập trung vào việc chống đầu cơ và soát vé tại cửa, tính năng hoàn vé sẽ được phát triển ở mức độ mở rộng (mức B) nếu cần thiết.
- Điểm yếu 4: Phí giao dịch (gas fee) trên mạng chính có thể cao hơn giá trị vé nếu sự kiện có giá trị nhỏ.
  - Trả lời: Đồ án được triển khai trên mạng thử nghiệm Sepolia hoặc các giải pháp Layer 2 để tối ưu hóa chi phí vận hành.
- Điểm yếu 5: Vé đã mua nhưng nếu ví người dùng bị mất khóa bảo mật (private key) thì không thể khôi phục.
  - Trả lời: Đây là đặc tính phi tập trung của công nghệ blockchain, người dùng bắt buộc phải tự bảo mật 12 từ khôi phục ví cá nhân từ Lab 1.