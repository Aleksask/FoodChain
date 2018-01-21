pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FoodChain.sol";

contract TestFoodChain {
    // Truffle will send the TestContract one Ether after deploying the contract.
    uint public initialBalance = 1 ether;

    function testCreateFarmer() public {


        FoodChain fc = FoodChain(DeployedAddresses.FoodChain());

        //uint expected = 10000;

        address test_address = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;

        fc.registerFarmer(test_address,"Farmer","Giles",0,0);

        //Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
    }
}