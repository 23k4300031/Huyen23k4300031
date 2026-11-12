# SPEC - Két tiết kiệm có khóa thời gian (TimeLockVault)

## 1. Mục đích
Hệ thống này cung cấp giải pháp ký gửi tiết kiệm cá nhân có khóa thời gian, giúp người dùng khóa số dư ETH lại và chỉ cho phép rút ra sau khi đã qua mốc thời gian định trước.

## 2. Đầu vào
- Tham số khởi tạo hợp đồng (`constructor`): `lockDurationSeconds` (kiểu `uint256`), thời gian khóa tính bằng giây, do người tạo két cung cấp.
- Hàm nạp tiền (`deposit`): Nhận số lượng ETH thông qua `msg.value` (kiểu `uint256`), do người gửi (bất kỳ ai) cung cấp.
- Hàm rút tiền (`withdraw`): Không có tham số đầu vào, gọi bởi chủ sở hữu két (`owner`).

## 3. Quy tắc nghiệp vụ
- R1: Bất kỳ địa chỉ ví nào cũng có thể gọi hàm `deposit` để nạp ETH vào két.
- R2: Chỉ chủ sở hữu tạo két (`owner`) mới có quyền gọi hàm `withdraw` để rút tiền.
- R3: Chỉ được phép rút tiền khi thời điểm hiện tại đã đạt hoặc vượt mốc mở khóa (`block.timestamp >= unlockTime`).
- R4: Số tiền nạp vào hợp đồng phải lớn hơn 0 (`msg.value > 0`).
- R5: Mọi giao dịch nạp và rút thành công đều phải phát ra sự kiện (`event Deposited`, `event Withdrawn`) để lưu vết.

## 4. Đầu ra
- Trạng thái số dư của két được cập nhật và lưu trữ an toàn trên blockchain.
- Kết quả giao dịch (Thành công/Thất bại) kèm theo mã băm giao dịch (`TxHash`) hiển thị trên ví MetaMask và trình duyệt Etherscan.

## 5. Trường hợp ngoại lệ
- Nếu người gọi hàm rút tiền không phải là chủ sở hữu két thì hệ thống phải từ chối và trả về lỗi `NotOwner`.
- Nếu thời điểm hiện tại chưa đến mốc mở khóa mà đã gọi hàm rút tiền thì hệ thống phải từ chối và trả về lỗi `StillLocked`.
- Nếu số dư trong két bằng 0 khi gọi rút tiền thì hệ thống phải từ chối và trả về lỗi `NothingToWithdraw`.

## 6. Ngoài phạm vi
- Không hỗ trợ thay đổi thời gian khóa sau khi hợp đồng đã được triển khai.
- Không hỗ trợ rút một phần số dư (hàm rút sẽ thực hiện rút toàn bộ số dư hiện có trong két).
- Không quy đổi giá trị ETH ra tiền pháp định (USD hoặc VNĐ).