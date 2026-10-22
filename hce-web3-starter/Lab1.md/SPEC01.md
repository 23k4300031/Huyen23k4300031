# SPEC - Lab 01: Cấu hình Môi trường Thực hành Web3 & Ví MetaMask

## 1. Mục đích

Cấu hình môi trường phát triển Web3, tạo lập ví MetaMask và liên kết kho lưu trữ GitHub phục vụ thực hành môn Tiền điện tử & Hợp đồng thông minh cho sinh viên Lê Dương Ngọc Huyền (MSSV: 23K4300031).

## 2. Đầu vào

- Trình duyệt web hỗ trợ Extension (Google Chrome / Brave).
- Tiện ích mở rộng ví MetaMask (MetaMask Extension).
- Tài khoản GitHub cá nhân và địa chỉ kho lưu trữ (Repository URL).
- Chuỗi cụm từ khôi phục bảo mật (Secret Recovery Phrase / Seed Phrase) do MetaMask khởi tạo.

## 3. Quy tắc nghiệp vụ

- R1: Mỗi sinh viên phải sở hữu duy nhất một địa chỉ ví Ethereum/Sepolia cá nhân trên MetaMask để phục vụ thực hành on-chain.
- R2: Khóa bảo mật (Private Key) và Cụm từ khôi phục (Seed Phrase) tuyệt đối không được đưa vào bất kỳ tệp báo cáo hoặc mã nguồn công khai nào trên GitHub.
- R3: Kho lưu trữ GitHub bài làm phải được đặt cấu trúc thư mục chuẩn bao gồm tệp cấu hình và các tệp báo cáo bằng định dạng Markdown (`.md`).
- R4: Tất cả các thao tác cập nhật bài làm phải được thực hiện thông qua các lệnh Git chuẩn (`git add`, `git commit`, `git push`).

## 4. Đầu ra

- Ví MetaMask đã khởi tạo thành công và được kết nối sẵn sàng trên trình duyệt.
- Địa chỉ ví cá nhân (dạng `0x...`) sẵn sàng cho việc nhận tiền thử nghiệm (Faucet) và giao dịch.
- Cấu trúc thư mục `lab01/` được đẩy lên kho lưu trữ GitHub cá nhân (`https://github.com/23k4300031/Huyen23k4300031.git`).

## 5. Trường hợp ngoại lệ

- Nếu người dùng làm mất hoặc quên Cụm từ khôi phục bảo mật (Seed Phrase) thì phải tạo lại ví MetaMask mới và cập nhật lại địa chỉ ví trong các báo cáo tiếp theo.
- Nếu xảy ra lỗi xung đột Git (Git Conflict) khi push bài thì hệ thống phải yêu cầu thực hiện `git pull` hoặc push đè có kiểm soát (`git push -f origin main`).
- If mạng mặc định không hiển thị mạng thử nghiệm Sepolia thì người dùng phải vào mục Cài đặt ví để bật chế độ "Hiển thị mạng thử nghiệm" (Show test networks).

## 6. Ngoài phạm vi

- Không bao gồm việc thực hiện giao dịch chuyển tiền thật (Mainnet ETH) trên mạng chính thức.
- Không bao gồm việc lập trình hoặc triển khai Smart Contract phức tạp trong bài Lab này.