# BÁO CÁO PHÂN TÍCH ON-CHAIN (LAB 03)

- **Sinh viên:** Lê Dương Ngọc Huyền (MSSV: 23K4300031)
- **Repo:** https://github.com/23k4300031/Huyen23k4300031

---

## 1. Mổ xẻ Giao dịch On-chain Cá nhân (Sepolia)
*Giao dịch thực nghiệm từ Lab 2.*

| Trường dữ liệu | Ý nghĩa kỹ thuật | Góc nhìn nghiệp vụ & Kiểm toán |
| :--- | :--- | :--- |
| **Status** | Thành công / Thất bại | Giao dịch hỏng vẫn tốn phí, cần hạch toán chi phí rủi ro. |
| **Block** | Vị trí khối chứa TX | Xác định chính xác mốc ghi nhận vào sổ cái blockchain. |
| **Timestamp** | Thời điểm ghi nhận | Làm căn cứ chốt tỷ giá và thời gian ghi nhận doanh thu/chi phí. |
| **From / To** | Địa chỉ ví gửi / nhận | Phục vụ định danh đối tác (KYC) và rà soát rửa tiền (AML). |
| **Value** | Số lượng token/ETH | Giá trị tài sản gốc được chuyển giao. |
| **Transaction Fee** | $Gas Used \times Gas Price$ | Chi phí vận hành mạng lưới, hạch toán riêng vào chi phí tài chính. |
| **Gas Price** | Giá mỗi đơn vị gas (Gwei) | Phản ánh mức độ nghẽn mạng tại thời điểm gửi lệnh. |
| **Gas Limit** | Lượng gas tối đa cho phép | Đặt thiếu sẽ bị hủy TX giữa chừng (*Out of Gas*) nhưng vẫn mất phí. |
| **Gas Used** | Lượng gas tiêu thụ thực tế | Xác định chính xác chi phí thực tế; nếu bằng Limit là bị nghẽn/hết gas. |
| **Nonce** | Số thứ tự TX của ví gửi | Kiểm tra giao dịch bị bỏ sót, ghi trùng hoặc bị đè lệnh (*override*). |

---

## 2. Phân tích Kỹ thuật & Smart Contract (USDC/USDT)

### A. Phân biệt Kỹ thuật
- **Bytecode vs Verified Code:** Bytecode là chuỗi mã máy Hex cho EVM đọc. Verified Code là mã nguồn Solidity gốc đã được Etherscan đối chiếu khớp 100% với Bytecode để công khai cho người dùng kiểm tra.
- **Hàm Read vs Write:**
  - *Read (View/Pure):* Chỉ truy vấn dữ liệu on-chain, miễn phí gas, thực thi ngay không cần ký ví.
  - *Write:* Thay đổi trạng thái dữ liệu trên sổ cái, tốn phí gas và bắt buộc ký qua ví MetaMask.

### B. Phân tích Hợp đồng Stablecoin (USDC)
1. **Xác thực mã nguồn:** Cả hợp đồng Proxy và Implementation của USDC đều đã được xác thực (*Verified Source Code*).
2. **Tổng cung:** Đọc qua hàm `totalSupply()` trong tab *Read as Proxy*. Kết quả thu được cần chia cho $10^6$ (do USDC dùng 6 decimals) để ra lượng lưu thông thực tế.
3. **Cơ chế đóng băng:** Trong tab *Write as Proxy*, chứa hàm `blacklist(address _account)` giúp bên phát hành (Circle) khóa tài khoản vi phạm. Điều này cho thấy tính quản trị tập trung vẫn tồn tại song song để đáp ứng pháp lý AML.