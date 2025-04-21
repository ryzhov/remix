/* eslint-disable no-undef */
// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("SimpleToken", function () {
  it("test totalSupply", async function () {
    const contractFactory = await ethers.getContractFactory("SimpleToken");
    const contract = await contractFactory.deploy(1024);
    await contract.deployed();
    console.log("contract deployed at:" + contract.address);

    expect((await contract.totalSupply()).toNumber()).to.equal(1024);
  });

  it("test balanceOf", async function () {
    const [acc_0] = await ethers.getSigners();
    const contractFactory = await ethers.getContractFactory("SimpleToken");
    const contract = await contractFactory.deploy(1024);
    await contract.deployed();
    console.log("contract deployed at:" + contract.address);

    expect((await contract.balanceOf(acc_0.address)).toNumber()).to.equal(1024);
  });

  it("test transfer", async function () {
    const [acc_0, acc_1] = await ethers.getSigners();
    const contractFactory = await ethers.getContractFactory("SimpleToken");
    const contract = await contractFactory.deploy(1024);
    await contract.deployed();
    console.log("contract deployed at:" + contract.address);

    await contract.transfer(acc_1.address, 95);
    expect((await contract.balanceOf(acc_0.address)).toNumber()).to.equal(929);
    expect((await contract.balanceOf(acc_1.address)).toNumber()).to.equal(95);
  });
});
