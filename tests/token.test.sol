// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/4_Token.sol";

contract TokenTest {
    SimpleToken token;
    
    function beforeAll() public {
        token = new SimpleToken(1024);
    }

    function checkTotalSupply() public {
        console.log("Running checkTotalSupply");
        Assert.equal(token.totalSupply(), uint(1024), "totalSupply should be 1024");
    }

    function checkBalanceOf() public {
        console.log("Running checkBalanceOf");
        Assert.equal(token.balanceOf(msg.sender), uint(1024), "balanceOf sender should be 1024");
    }

    function checkTransfer() public {
        address to = address(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        uint256 value = 95;
        console.log("Running checkTransfer");
        token.transfer(to, value);
        Assert.equal(token.balanceOf(msg.sender), uint(929), "balanceOf sender should be 929");
        Assert.equal(token.balanceOf(to), uint(95), "balanceOf recipient should be 95");
    }
}
