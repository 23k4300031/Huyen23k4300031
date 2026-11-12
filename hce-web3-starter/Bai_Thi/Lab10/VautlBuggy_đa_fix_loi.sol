// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VaultBuggy {
    address public immutable owner;
    uint256 public immutable unlockTime;

    // Sự kiện ghi nhận trạng thái
    event Deposited(address indexed sender, uint256 amount);
    event Withdrawn(address indexed receiver, uint256 amount);

    // Custom errors tiết kiệm gas hơn require string
    error NotOwner();
    error StillLocked(uint256 currentTime, uint256 unlockTime);
    error ZeroDeposit();
    error NothingToWithdraw();
    error TransferFailed();

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    constructor(uint256 lockSeconds) {
        owner = msg.sender;
        unlockTime = block.timestamp + lockSeconds;
    }

    /// @notice Nạp ETH vào két
    function deposit() external payable {
        if (msg.value == 0) revert ZeroDeposit();
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Rút toàn bộ tiền sau khi hết hạn khóa (chỉ Owner)
    function withdraw() external onlyOwner {
        // 1. Checks (Kiểm tra điều kiện)
        if (block.timestamp < unlockTime) {
            revert StillLocked(block.timestamp, unlockTime);
        }

        uint256 balance = address(this).balance;
        if (balance == 0) revert NothingToWithdraw();

        // 2. Effects (Phát sự kiện / Thay đổi trạng thái TRƯỚC)
        emit Withdrawn(owner, balance);

        // 3. Interactions (Chuyển tiền ra ngoài SAU CÙNG)
        (bool success, ) = payable(owner).call{value: balance}("");
        if (!success) revert TransferFailed();
    }
}