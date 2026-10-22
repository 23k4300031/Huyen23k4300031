# PHÂN TÍCH ON-CHAIN LAB 03: ĐỌC GIAO DỊCH VÀ HỢP ĐỒNG TRÊN ETHERSCAN

## Bước 1: Bảng giải thích các trường trong một Giao dịch (Transaction)

| Trường | Ý nghĩa | Vì sao người làm nghiệp vụ cần |
| :--- | :--- | :--- |
| **Status** | Trạng thái thành công hay thất bại của giao dịch. | Giao dịch thất bại vẫn mất phí — ảnh hưởng hạch toán. |
| **Block** | Số thứ tự khối chứa giao dịch. | Xác định thời điểm ghi nhận giao dịch vào sổ cái. |
| **Timestamp** | Thời gian chính xác giao dịch được xác nhận. | Mốc ghi nhận doanh thu / chi phí. |
| **From / To** | Ví gửi / ví nhận (hoặc địa chỉ hợp đồng). | Đối tượng cần xác minh danh tính. |
| **Value** | Số lượng token / ETH chuyển đi. | Giá trị giao dịch. |
| **Transaction Fee** | Phí thực trả cho giao dịch ($Fee = Gas Used \times Gas Price$). | Chi phí giao dịch, cần hạch toán riêng. |
| **Gas Price** | Đơn giá phí gas cho mỗi đơn vị tính bằng Gwei. | Giải thích vì sao cùng một giao dịch mà phí khác nhau. |
| **Gas Limit** | Mức gas tối đa người gửi cho phép dùng. | Đặt quá thấp $\rightarrow$ giao dịch thất bại vì hết gas (*Out of Gas*) nhưng vẫn mất phí. |
| **Gas Used** | Lượng gas thực tế đã tiêu tốn. | Cùng Gas Price với Gas Used tính ra phí: $Transaction\ Fee = Gas\ Used \times Gas\ Price$. $Gas\ Used = Gas\ Limit$ là dấu hiệu hết gas. |
| **Nonce** | Số thứ tự giao dịch phát ra từ ví gửi. | Phát hiện giao dịch bị bỏ sót hoặc thay thế. |

---

## Bước 2 & 3: Phân tích Hợp đồng Thông minh USDC (Ethereum Mainnet)

- **Địa chỉ Proxy:** `0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48`

### Câu trả lời theo yêu cầu bài lab:

1. **Hợp đồng bạn xem có công bố mã nguồn đã xác thực không?**
   - **Có.** Mã nguồn của hợp đồng Proxy và hợp đồng Implementation (logic) đều đã được xác thực (Verified Source Code) trên Etherscan.

2. **Tổng cung của đồng đó là bao nhiêu? Đọc ra từ hàm nào?**
   - **Đọc ra từ hàm:** `totalSupply()` trong tab **Read as Proxy** (hoặc `Read Contract`).
   - **Tổng cung:** Lấy số liệu hiển thị trực tiếp từ hàm `totalSupply()` chia cho $10^6$ (vì USDC có 6 decimals).

3. **Trong tab Write Contract (với USDC: Write as Proxy), có hàm nào cho phép một địa chỉ đặc biệt đóng băng tài khoản người khác không? Nếu có, tên hàm là gì?**
   - **Có.** 
   - **Tên hàm:** `blacklist(address _account)` (và hàm mở đóng băng là `unblacklist(address _account)`).
   - **Giải thích:** Hàm này thuộc cơ chế quản trị rủi ro và tuân thủ pháp lý của tổ chức phát hành (Centre/Circle), cho phép địa chỉ quản trị (Blacklister) chặn toàn bộ giao dịch chuyển tiền của địa chỉ bị đưa vào danh sách đen.