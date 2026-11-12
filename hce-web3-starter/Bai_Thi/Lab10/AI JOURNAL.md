# NHẬT KÝ LÀM VIỆC VỚI AI - LAB 10
**Bài thực hành:** Rà soát mã nguồn do AI sinh ra (`VaultBuggy.sol`)

## Bảng tổng hợp 4 lỗi cốt lõi

| Lỗi | Mô tả | Ai phát hiện | Cách khắc phục |
| :--- | :--- | :--- | :--- |
| **1** | Hàm `withdraw()` không kiểm tra người gọi có phải là chủ sở hữu (`owner`) hay không, khiến bất kỳ ai cũng có thể rút sạch tiền trong két. | Sinh viên & AI | Bổ sung modifier `onlyOwner` (kiểm tra `msg.sender == owner`) cho hàm `withdraw()`. |
| **2** | Điều kiện thời gian bị đảo chiều (`block.timestamp <= unlockTime` thay vì `>=`), cho phép rút trước hạn và khóa vĩnh viễn sau khi hết hạn. | Sinh viên & AI | Đổi điều kiện kiểm tra sang `if (block.timestamp < unlockTime) revert StillLocked(...)`. |
| **3** | Sử dụng `.transfer()` giới hạn cứng 2.300 gas, dễ gây lỗi thất bại (DoS) nếu ví nhận là một hợp đồng thông minh. | AI | Thay thế bằng phương thức gọi mức thấp `.call{value: balance}("")` và kiểm tra biến trả về `success`. |
| **4** | Khai báo biến `private emergencyPin` và lầm tưởng dữ liệu được bảo mật, nhưng thực tế ai cũng đọc được qua lệnh truy vấn ô nhớ `eth_getStorageAt`. | Sinh viên (thực nghiệm) & AI | Không lưu mật khẩu/mã PIN dạng văn bản thuần trên blockchain; xóa bỏ biến này hoặc chỉ lưu mã băm (`keccak256`). |

## Nhận xét bổ sung về mã AI sinh ra
- **Điểm tốt:** AI phát hiện đủ cả 4 lỗi và gợi ý thêm các cải tiến tốt (như dùng Custom Errors, `immutable`, thêm Events).
- **Chỗ sinh viên tự phát hiện và sửa lại từ mã AI:** Trong bản mã sửa lỗi, AI đặt lệnh `emit Withdrawn(...)` nằm **sau** lệnh chuyển tiền `.call`. Sinh viên đã chủ động đảo `emit` lên trước `.call` để tuân thủ nghiêm ngặt quy tắc *Checks - Effects - Interactions* trong `AGENTS.md`.