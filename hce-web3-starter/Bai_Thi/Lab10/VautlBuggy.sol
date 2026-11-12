// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// CẢNH BÁO: Tệp này có lỗi cố ý.
contract VaultBuggy {
    address public owner;
    uint256 public unlockTime;
    uint256 private emergencyPin; // Mã bí mật

    constructor(uint256 lockSeconds, uint256 _pin) {
        owner = msg.sender;
        unlockTime = block.timestamp + lockSeconds;
        emergencyPin = _pin;
    }

    function deposit() external payable {}

    function withdraw() external {
        require(block.timestamp <= unlockTime, "Chua den han rut tien");
        payable(msg.sender).transfer(address(this).balance);
    }
}