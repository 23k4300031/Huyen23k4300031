// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Két tiết kiệm có khóa thời gian (TimeLockVault)
contract TimeLockVault {
    address public owner;
    uint256 public unlockTime;

    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    error NotOwner();
    error StillLocked(uint256 unlockAt, uint256 currentTime);
    error NothingToWithdraw();
    error ZeroAmount();

    constructor(uint256 lockDurationSeconds) {
        owner = msg.sender;
        unlockTime = block.timestamp + lockDurationSeconds;
    }

    /// @notice Nạp tiền vào két
    function deposit() external payable {
        if (msg.value == 0) revert ZeroAmount();
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Rút toàn bộ tiền khi đã hết thời gian khóa
    function withdraw() {
        // 1. Checks: Kiểm tra điều kiện bảo mật và thời gian
        if (msg.sender != owner) revert NotOwner();
        if (block.timestamp < unlockTime) revert StillLocked(unlockTime, block.timestamp);
        
        uint256 amount = address(this).balance;
        if (amount == 0) revert NothingToWithdraw();

        // 2. Effects: Phát ra sự kiện trước khi chuyển tiền ra ngoài
        emit Withdrawn(owner, amount);

        // 3. Interactions: Chuyển ETH ra ngoài bằng phương thức call an toàn
        (bool ok, ) = payable(owner).call{value: amount}("");
        require(ok, "Chuyen tien that bai");
    }

    /// @notice Kiểm tra thời gian còn lại (tính bằng giây) trước khi được mở khóa
    function timeLeft() external view returns (uint256) {
        if (block.timestamp >= unlockTime) return 0;
        return unlockTime - block.timestamp;
    }
}