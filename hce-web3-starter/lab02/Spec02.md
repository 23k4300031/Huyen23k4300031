# SPEC - Lab 02: Thực hành giao dịch trên Sepolia Testnet

## 1. Mục đích

Thực hiện và xác thực giao dịch chuyển Sepolia ETH on-chain từ ví MetaMask cá nhân (`0x2104fbB408d59740fa14B1d2302B15972b60400D`) trên mạng thử nghiệm Sepolia.

## 2. Đầu vào

- Ví MetaMask đã kết nối mạng Sepolia với số dư khả dụng (SepoliaETH)[cite: 5].
- Địa chỉ ví nhận (To)[cite: 7].
- Mã định danh giao dịch (TxHash) sau khi thực hiện lệnh chuyển tiền[cite: 7].

## 3. Quy tắc nghiệp vụ

- R1: Giao dịch phải được thực hiện thành công và được xác nhận trên mạng thử nghiệm Sepolia[cite: 7].
- R2: Địa chỉ ví gửi, địa chỉ ví nhận và mã giao dịch (TxHash) phải khớp chính xác với dữ liệu ghi nhận trên chuỗi khối (Etherscan)[cite: 7].
- R3: Thông tin kết quả thực nghiệm phải được tổng hợp vào tệp báo cáo định dạng Markdown (`.md`) và đẩy lên kho lưu trữ GitHub cá nhân.

## 4. Đầu ra

- Giao dịch chuyển tiền hoàn tất với trạng thái **Đã xác nhận (Success)**[cite: 7].
- Tệp báo cáo chi tiết thông số giao dịch (TxHash `0x6099d81cf0ae43dba03fc51b4cb39a3fd34185f596f3e45acd0d8e97d64a7816`) được lưu trữ trong cấu trúc thư mục của dự án[cite: 7].

## 5. Trường hợp ngoại lệ

- Nếu giao dịch bị kẹt hoặc thất bại do thiếu phí gas, hệ thống phải yêu cầu điều chỉnh lại mức phí hoặc thực hiện lại giao dịch.
- Nếu sai lệch địa chỉ ví nhận, giao dịch không thể đảo ngược và người dùng phải thực hiện lại lệnh chuyển mới đến địa chỉ chính xác.
- Nếu không đồng bộ được mã nguồn lên GitHub, người dùng phải sử dụng lệnh `git push -f origin main` để cập nhật ép buộc.

## 6. Ngoài phạm vi

- Không thực hiện giao dịch chuyển tiền thật trên mạng chính thức (Ethereum Mainnet).
- Không bao gồm việc viết hoặc triển khai hợp đồng thông minh phức tạp trong bài Lab này.