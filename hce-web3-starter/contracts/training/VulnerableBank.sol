<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BIGBANG WORLD TOUR [MADE] HANOI - VIP Ticketing DApp</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ethers/6.7.0/ethers.umd.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-primary: #070913;
            --bg-card: #0f172a;
            --border-glow: rgba(236, 72, 153, 0.3);
            --accent-pink: #ec4899;
            --accent-purple: #8b5cf6;
            --accent-gold: #f59e0b;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --success: #10b981;
            --danger: #ef4444;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--bg-primary);
            color: var(--text-main);
            min-height: 100vh;
            padding: 30px 15px;
            background-image: 
                radial-gradient(circle at 15% 15%, rgba(236, 72, 153, 0.15) 0%, transparent 45%),
                radial-gradient(circle at 85% 85%, rgba(139, 92, 246, 0.15) 0%, transparent 45%),
                radial-gradient(circle at 50% 50%, rgba(245, 158, 11, 0.08) 0%, transparent 60%);
            background-attachment: fixed;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
        }

        .hero {
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.9) 0%, rgba(30, 27, 75, 0.9) 100%);
            border: 1px solid var(--border-glow);
            border-radius: 28px;
            padding: 50px 30px;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.7), 0 0 40px rgba(236, 72, 153, 0.15);
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: -150px;
            left: 50%;
            transform: translateX(-50%);
            width: 350px;
            height: 350px;
            background: linear-gradient(135deg, var(--accent-pink), var(--accent-purple));
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.25;
            z-index: 0;
        }

        .hero > * {
            position: relative;
            z-index: 1;
        }

        .badge-kpop {
            background: linear-gradient(135deg, var(--accent-pink), var(--accent-purple));
            color: #fff;
            padding: 8px 20px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            box-shadow: 0 4px 20px rgba(236, 72, 153, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 20px;
        }

        .hero h1 {
            font-size: 42px;
            font-weight: 900;
            background: linear-gradient(to right, #fff, #f472b6, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 12px;
            letter-spacing: 0.5px;
        }

        .hero p {
            color: var(--text-muted);
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .wallet-bar {
            background: var(--bg-card);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 18px;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
        }

        .wallet-status {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .pulse-dot {
            width: 12px;
            height: 12px;
            background-color: var(--success);
            border-radius: 50%;
            box-shadow: 0 0 12px var(--success);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.7); }
            70% { transform: scale(1); box-shadow: 0 0 0 10px rgba(16, 185, 129, 0); }
            100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
        }

        .grid-layout {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 25px;
        }

        @media (max-width: 850px) {
            .grid-layout {
                grid-template-columns: 1fr;
            }
        }

        .card {
            background: var(--bg-card);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            border-color: rgba(236, 72, 153, 0.4);
            transform: translateY(-4px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6), 0 0 25px rgba(236, 72, 153, 0.15);
        }

        .card h3 {
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            padding-bottom: 15px;
        }

        .card h3 i {
            color: var(--accent-pink);
        }

        .perks-box {
            background: rgba(7, 9, 19, 0.6);
            border: 1px dashed rgba(255, 255, 255, 0.12);
            border-radius: 16px;
            padding: 18px;
            margin-bottom: 22px;
            font-size: 14px;
            color: var(--text-muted);
            line-height: 1.7;
        }

        .perks-box strong {
            color: #fff;
        }

        .highlight-price {
            color: var(--accent-gold);
            font-weight: 800;
            font-size: 16px;
        }

        label {
            display: block;
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 8px;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 15px 18px;
            background: #070919;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            color: #fff;
            font-size: 15px;
            font-family: 'Outfit', sans-serif;
            margin-bottom: 20px;
            transition: all 0.2s;
        }

        input:focus {
            outline: none;
            border-color: var(--accent-pink);
            box-shadow: 0 0 15px rgba(236, 72, 153, 0.25);
        }

        button {
            background: linear-gradient(135deg, var(--accent-pink), var(--accent-purple));
            color: #fff;
            border: none;
            padding: 16px 24px;
            font-size: 15px;
            font-weight: 800;
            border-radius: 14px;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(236, 72, 153, 0.35);
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(236, 72, 153, 0.5);
            filter: brightness(1.1);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            box-shadow: 0 8px 25px rgba(59, 130, 246, 0.35);
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #b91c1c);
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.35);
        }

        .btn-outline {
            background: transparent;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: auto;
            padding: 12px 22px;
            font-weight: 600;
            box-shadow: none;
            text-transform: none;
            letter-spacing: 0;
        }

        .btn-outline:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: var(--accent-pink);
            color: var(--accent-pink);
            box-shadow: none;
        }

        .console-box {
            margin-top: 20px;
            background: #070919;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 14px;
            padding: 16px;
            font-size: 13px;
            font-family: monospace;
            color: #38bdf8;
            min-height: 45px;
            word-break: break-all;
            line-height: 1.6;
            display: flex;
            align-items: center;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .contract-info {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: var(--text-muted);
            font-family: monospace;
            background: rgba(15, 23, 42, 0.5);
            padding: 12px;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="hero">
            <span class="badge-kpop"><i class="fa-solid id="kpop-icon">👑</i> K-POP WORLD TOUR LIVE</span>
            <h1>BIGBANG HANOI [MADE] 2026</h1>
            <p><i class="fa-solid fa-location-dot" style="color: var(--accent-pink);"></i> Sân vận động Quốc gia Mỹ Đình &nbsp;|&nbsp; <i class="fa-solid fa-shield-halved" style="color: var(--success);"></i> Smart Contract Chống Đầu Cơ Vé 10% On-Chain</p>
        </div>

        <div class="wallet-bar">
            <div class="wallet-status">
                <div class="pulse-dot" id="pulseIndicator"></div>
                <div>
                    <span style="font-size: 10px; color: var(--text-muted); display: block; letter-spacing: 1px; font-weight: 700;">TRẠNG THÁI KẾT NỐI VÍ</span>
                    <span id="walletAddress" style="font-size: 14px; color: #fff; font-weight: 600; font-family: monospace;">Chưa kết nối MetaMask</span>
                </div>
            </div>
            <button class="btn-outline" onclick="connectWallet()"><i class="fa-solid fa-wallet"></i> Kết nối Ví Web3</button>
        </div>

        <div class="grid-layout">
            <div class="card">
                <h3><i class="fa-solid fa-ticket"></i> Mua Vé Sơ Cấp (Mint NFT)</h3>
                <div class="perks-box">
                    <i class="fa-solid fa-star" style="color: var(--accent-gold);"></i> <strong>Đặc quyền:</strong> Vé NFT định danh độc quyền.<br>
                    <i class="fa-solid fa-coins" style="color: var(--accent-gold);"></i> <strong>Giá niêm yết:</strong> <span class="highlight-price">0.05 ETH</span><br>
                    <i class="fa-solid fa-lock" style="color: var(--accent-pink);"></i> <strong>Bảo mật:</strong> Giới hạn nghiêm ngặt <strong>01 vé / ví</strong> chống phe vé hoàn toàn.
                </div>
                <button onclick="buyTicket()"><i class="fa-solid fa-bolt"></i> Thanh Toán & Nhận Vé Ngay</button>
                <div class="console-box" id="buyLog"><i class="fa-solid fa-terminal" style="margin-right: 8px; color: var(--text-muted);"></i> Trạng thái: Chờ kết nối ví blockchain...</div>
            </div>

            <div class="card">
                <h3><i class="fa-solid fa-magnifying-glass-chart"></i> Tra Cứu Thông Tin Vé</h3>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 20px; line-height: 1.6;">
                    Kiểm tra trực tiếp quyền sở hữu minh bạch của bất kỳ mã định danh vé nào trên mạng lưới Sepolia.
                </p>
                <label><i class="fa-solid fa-hashtag"></i> Nhập Token ID của vé:</label>
                <input type="number" id="queryId" placeholder="Ví dụ: 1">
                <button onclick="checkOwner()" class="btn-secondary"><i class="fa-solid fa-shield-cat"></i> Truy Vấn On-Chain</button>
                <div class="console-box" id="queryLog" style="color: #60a5fa;"><i class="fa-solid fa-terminal" style="margin-right: 8px; color: var(--text-muted);"></i> Kết quả truy vấn sẽ hiển thị tại đây...</div>
            </div>

            <div class="card full-width">
                <h3><i class="fa-solid fa-qrcode"></i> Cổng Soát Vé Cửa Vào (Ban Tổ Chức)</h3>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 20px;">
                    Quét xác thực vé tại cổng sự kiện Sân vận động Mỹ Đình. Hệ thống tự động khóa trạng thái sử dụng vĩnh viễn ngăn chặn hành vi tái sử dụng.
                </p>
                <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                    <input type="number" id="checkinId" placeholder="Nhập Token ID cần check-in..." style="margin-bottom: 0; flex: 1; min-width: 240px;">
                    <button onclick="checkInTicket()" class="btn-danger" style="width: 260px;"><i class="fa-solid fa-circle-check"></i> Xác Nhận Check-In</button>
                </div>
                <div class="console-box" id="checkinLog" style="color: #f87171; margin-top: 20px;"><i class="fa-solid fa-terminal" style="margin-right: 8px; color: var(--text-muted);"></i> Nhật ký cổng soát vé trực tuyến trống...</div>
            </div>
        </div>

        <div class="contract-info">
            <i class="fa-solid fa-file-contract"></i> Smart Contract Address (Sepolia): <strong>0x0E54D73970C0e802585bdB1561370ff1A05286B1</strong>
        </div>
    </div>

    <script>
        const CONTRACT_ADDRESS = "0x0E54D73970C0e802585bdB1561370ff1A05286B1";
        
        const CONTRACT_ABI = [
            "function buyTicket() external payable",
            "function ownerOf(uint256 tokenId) view returns (address)",
            "function checkIn(uint256 tokenId) external"
        ];

        let provider, signer, contract;

        async function connectWallet() {
            if (window.ethereum) {
                try {
                    provider = new ethers.BrowserProvider(window.ethereum);
                    signer = await provider.getSigner();
                    const address = await signer.getAddress();

                    contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);

                    document.getElementById("walletAddress").innerHTML = `<span style="color: var(--success); font-weight: 700;">Đã kết nối: ${address.substring(0, 6)}...${address.substring(38)}</span>`;
                    document.getElementById("buyLog").innerText = "⚡ Sẵn sàng thực hiện giao dịch mua vé sự kiện trực tuyến.";
                } catch (error) {
                    alert("Người dùng từ chối kết nối ví!");
                }
            } else {
                alert("Vui lòng cài đặt tiện ích MetaMask trên trình duyệt!");
            }
        }

        async function buyTicket() {
            if (!contract) { alert("Vui lòng kết nối ví MetaMask trước!"); return; }
            try {
                document.getElementById("buyLog").innerText = "⏳ Đang gửi yêu cầu mua vé lên mạng (0.05 ETH)...";
                const tx = await contract.buyTicket({ value: ethers.parseEther("0.05") });
                document.getElementById("buyLog").innerText = `🔗 Đã gửi TX: ${tx.hash}. Đang chờ mạng xác nhận...`;
                await tx.wait();
                document.getElementById("buyLog").innerText = "🎉 Giao dịch thành công! Vé NFT BigBang đã được đúc vào ví của bạn.";
            } catch (error) {
                document.getElementById("buyLog").innerText = "❌ Lỗi giao dịch: " + (error.reason || error.message);
            }
        }

        async function checkOwner() {
            if (!contract) { alert("Vui lòng kết nối ví MetaMask trước!"); return; }
            const tokenId = document.getElementById("queryId").value;
            if (!tokenId) { alert("Vui lòng nhập Token ID cần tra cứu!"); return; }
            try {
                document.getElementById("queryLog").innerText = `🔍 Đang truy vấn Smart Contract cho vé #${tokenId}...`;
                const owner = await contract.ownerOf(tokenId);
                document.getElementById("queryLog").innerText = `✅ Vé #${tokenId} thuộc sở hữu của ví:\n${owner}`;
            } catch (error) {
                document.getElementById("queryLog").innerText = "❌ Không tìm thấy thông tin hoặc vé chưa được đúc!";
            }
        }

        async function checkInTicket() {
            if (!contract) { alert("Vui lòng kết nối ví MetaMask trước!"); return; }
            const tokenId = document.getElementById("checkinId").value;
            if (!tokenId) { alert("Vui lòng nhập Token ID soát vé!"); return; }
            try {
                document.getElementById("checkinLog").innerText = `🛡️ Đang thực hiện khóa vé #${tokenId} tại cổng soát vé...`;
                const tx = await contract.checkIn(tokenId);
                await tx.wait();
                document.getElementById("checkinLog").innerText = `✅ Check-in thành công cho vé #${tokenId}! Vé đã chính thức được khóa trạng thái sử dụng.`;
            } catch (error) {
                document.getElementById("checkinLog").innerText = "❌ Lỗi check-in: " + (error.reason || error.message);
            }
        }
    </script>
</body>
</html>