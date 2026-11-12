# BigBang Ticket Chain — Hệ thống Vé sự kiện Giới hạn Bán lại & Chống Đầu cơ trên Blockchain

- **Đồ án Capstone môn học:** Tiền điện tử và Hợp đồng thông minh (ECO2432)
- **Khoa:** Hệ thống Thông tin Kinh tế — Trường Đại học Kinh tế, Đại học Huế
- **Giảng viên hướng dẫn:** TS. Hà Ngọc Long
- **Kho lưu trữ chính thức:** [GitHub Repository](https://github.com/23k4300031/Huyen23k4300031)
- **Website DApp trực tuyến (GitHub Pages):** `https://23k4300031.github.io/Huyen23k4300031/`
- **Mạng thử nghiệm triển khai:** Ethereum Sepolia Testnet

---

## 👥 Thành viên thực hiện

| STT | Họ và tên sinh viên | Mã sinh viên | Lớp | Vai trò dự án |
| :---: | :--- | :---: | :---: | :--- |
| **1** | Lê Dương Ngọc Huyền | `23K4300031` | K57 Kinh Tế Số | Phát triển Hợp đồng Thông minh, Giao diện Web3 & Tài liệu Đồ án |

---

## 🎯 Giới thiệu Đề tài & Tài liệu Capstone

- **Chủ đề lựa chọn:** Đề tài 6 — Vé sự kiện giới hạn bán lại (Case study: Concert BigBang tại Hà Nội)
- **Tên sản phẩm:** `EventTicket` — Vé sự kiện NFT chuẩn ERC-721
- **Tuyên bố giá trị định vị (Value Proposition):**
  > *“Hệ thống phát hành và quản lý vé sự kiện phi tập trung dựa trên chuẩn NFT (ERC-721) trên mạng Ethereum Sepolia, giúp Ban tổ chức Concert BigBang triệt tiêu hoàn toàn nạn vé giả, kiểm soát chặt chẽ trần sở hữu ví và ngăn chặn tình trạng đầu cơ, thổi giá vé trên thị trường thứ cấp thông qua cơ chế tự động thực thi của Hợp đồng thông minh.”*

- **Địa chỉ Hợp đồng Thông minh (Sepolia Testnet):** 
  `0x........................................`

---

## 💡 Tổng quan nghiệp vụ: Bài toán Thực tiễn, Triết lý Web3 & Tính năng Cốt lõi

### 1. Tại sao cần có Blockchain? Bài toán Thực tế của Thị trường Vé Sự kiện
Trong các sự kiện âm nhạc lớn (như Concert BigBang tại Hà Nội), hệ thống phân phối vé truyền thống luôn đối mặt với ba vấn đề nghiêm trọng:
- **Vấn nạn vé giả & sao chép mã QR:** Vé giấy hoặc mã QR tĩnh trên cơ sở dữ liệu tập trung dễ bị làm giả, chụp màn hình bán lại cho nhiều người cùng lúc, gây hỗn loạn tại cổng soát vé.
- **Tình trạng đầu cơ "phe vé" (Scalping):** Các nhóm đầu cơ sử dụng công cụ thu gom hàng loạt vé sơ cấp rồi đẩy giá lên gấp nhiều lần trên chợ đen, làm thiệt hại trực tiếp đến khán giả chân chính và uy tín của Ban tổ chức.
- **Giải pháp Bất biến từ Blockchain:** Mỗi tấm vé được đúc (mint) thành một tài sản số độc nhất (**NFT chuẩn ERC-721**) mang mã định danh `tokenId` riêng biệt. Mọi lịch sử mua bán, chuyển nhượng và trạng thái sử dụng vé đều được ghi nhận công khai, minh bạch trên sổ cái Sepolia, không ai có thể làm giả hay sửa đổi.

### 2. Triết lý Thiết kế: Tự động hóa Quy tắc Kinh tế & Bảo mật
- **Kiểm soát trần sở hữu sơ cấp (`hasTicket`):** Mỗi địa chỉ ví chỉ được phép mua tối đa **01 vé** trực tiếp từ hợp đồng nhằm ngăn chặn hành vi gom vé số lượng lớn ngay từ khâu mở bán.
- **Chặn chuyển nhượng vé đã sử dụng (`_update`):** Tích hợp cơ chế kiểm tra trạng thái tại hàm `_update` của OpenZeppelin v5. Ngay khi vé được soát tại cổng (`used[tokenId] == true`), hợp đồng tự động khóa vĩnh viễn quyền chuyển nhượng để chống việc quay vòng vé vào cổng nhiều lần.
- **Phân quyền chặt chẽ (`Ownable`) & Chống tái nhập:** Chỉ ví của Ban tổ chức (`onlyOwner`) mới có quyền thực hiện thao tác soát vé (`checkIn`) và rút doanh thu (`withdraw`) theo chuẩn bảo mật Checks-Effects-Interactions.

### 3. Trải nghiệm 3 Luồng Nghiệp vụ Chính trên Giao diện Web DApp (`index.html`)
1. **Kết nối Ví & Tra cứu Quyền sở hữu Vé:**
   * Người tham dự kết nối ví MetaMask (mạng Sepolia Testnet) trực tiếp trên trình duyệt.
   * Nhập mã số vé (`tokenId`) để hệ thống truy vấn dữ liệu thời gian thực từ Blockchain, hiển thị chính xác địa chỉ ví đang nắm giữ hợp pháp tấm vé đó.
2. **Mua Vé Sơ cấp Trực tuyến (`buy`):**
   * Khán giả thanh toán đúng giá vé niêm yết bằng ETH thông qua giao diện web.
   * Hợp đồng tự động kiểm tra số lượng vé còn lại (`maxSupply`), giới hạn mỗi ví 1 vé và mint ngay vé NFT vào ví người mua.
3. **Cổng Soát Vé Điện tử Dành cho Ban Tổ Chức (`checkIn`):**
   * Nhân viên soát vé tại sự kiện nhập mã `tokenId` của khán giả để xác thực và đánh dấu vé đã sử dụng trên chuỗi.
   * Nếu vé không tồn tại hoặc đã qua sử dụng, hệ thống lập tức cảnh báo lỗi (`NotFound` / `AlreadyUsed`) và từ chối cho qua cổng.

---

## 📂 Danh mục Sản phẩm & Tiến độ Triển khai Đồ án (Lab 8 – 15)

| Giai đoạn | Sản phẩm bàn giao | Mô tả nghiệp vụ & kỹ thuật | Trạng thái |
| :--- | :--- | :--- | :---: |
| **Bài thực hành 8** | `Bai_Thi/Lab8/tokenomics.md`<br>`Bai_Thi/Lab8/EventTicket.sol` | Thiết kế quy tắc kinh tế sản phẩm vé sự kiện: đơn vị giá trị ERC-721, nguồn thu, quy tắc chống đầu cơ và phản biện rủi ro quản trị | ✅ Hoàn thành |
| **Bài thực hành 9** | `Bai_Thi/lab9/SPEClab9.md`<br>`Bai_Thi/lab9/TimeLockVault.sol` | Xây dựng đặc tả nghiệp vụ chi tiết và triển khai hợp đồng thông minh có khóa thời gian theo chuẩn Checks-Effects-Interactions | ✅ Hoàn thành |
| **Bài thực hành 10** | `Bai_Thi/Lab10/AI JOURNAL.md`<br>`Bai_Thi/Lab10/VautlBuggy_da_fix_loi.sol` | Rà soát mã nguồn do AI sinh ra, phát hiện và khắc phục các lỗ hổng phân quyền, điều kiện thời gian và bảo mật dữ liệu | ✅ Hoàn thành |
| **Bài thực hành 11** | `Bai_Thi/Lab11/index.html` | Xây dựng giao diện Web3 DApp cơ bản kết nối MetaMask qua Ethers.js v6 và gọi hàm đọc trạng thái chủ sở hữu vé (`ownerOf`) | ✅ Hoàn thành |
| **Bài thực hành 12** | `Bai_Thi/Lab12/` | Khởi động đề tài Capstone (Đề tài 6: Vé sự kiện giới hạn bán lại), xác lập phạm vi và luồng demo cốt lõi | ✅ Hoàn thành |
| **Bài thực hành 13** | `contracts/training/VulnerableBank.sol` | Thực nghiệm mô phỏng tấn công tái nhập (Reentrancy) và áp dụng cơ chế vá lỗi bảo mật cho hợp đồng giữ tiền | ✅ Hoàn thành |
| **Bài thực hành 14** | `Bai_Thi/Lab14/audit-report.md` | Rà soát chéo mã nguồn hợp đồng thông minh, kiểm tra phân quyền, thứ tự giao dịch và xử lý ngoại lệ | ✅ Hoàn thành |
| **Bài thực hành 15** | `Bai