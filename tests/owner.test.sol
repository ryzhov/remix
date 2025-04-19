// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/2_Owner.sol";

contract OwnerTest {
    Owner ownerTestContract;
    address private ownerTestContractCreatorAddress;
    
    function beforeAll() public {        
        ownerTestContract = new Owner();
    }
    
    function afterAll() public {
        delete ownerTestContract;
    }
    
    function checkGetOwner() public {
        console.log("Running checkGetOwner");
        Assert.equal(ownerTestContract.getOwner(), msg.sender, "transaction sender should be owner");
    }

    function checkChangeOwner() public {
        address newOwner = address(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        console.log("Running checkChangeOwner");
        Assert.equal(msg.sender, ownerTestContract.getOwner(), "only owner can change owner");
        ownerTestContract.changeOwner(newOwner);
        Assert.equal(ownerTestContract.getOwner(), newOwner, "owner should become 4B2099...02db");
    }
}
