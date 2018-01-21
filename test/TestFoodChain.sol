pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FoodChain.sol";

//(Test contract name must match filename)
contract TestFoodChain {
    // Truffle will send the TestContract one Ether after deploying the contract.
    uint public initialBalance = 1 ether;

    function testCreateFarmerWithField() public {
        FoodChain fc = FoodChain(DeployedAddresses.FoodChain());

        address farmerAddress = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;

        fc.registerFarmer(farmerAddress,"Farmer","Giles",0,0);

        fc.registerFarmerField(farmerAddress, "COFFEE", 10);
    }

    function testCreateBuyerWithOrder() public {
        FoodChain fc = FoodChain(DeployedAddresses.FoodChain());

        address buyerAddress = 0x821aEa9a577a9b44299B9c15c88cf3087F3b5544;
        fc.registerBuyer(buyerAddress, "Con Sumer", "client location");

        var orderId = fc.putAnOrder("COFFEE", 10, 2000, buyerAddress);

        Assert.equal(orderId, 1, "Incorrect order id");
    }

    function testMatch() public {
        FoodChain fc = FoodChain(DeployedAddresses.FoodChain());

        // Create farmer and buyer...
        address farmerAddress = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;
        address buyerAddress = 0x821aEa9a577a9b44299B9c15c88cf3087F3b5544;

        fc.registerFarmer(farmerAddress,"Farmer","Giles",0,0);
        fc.registerFarmerField(farmerAddress, "COFFEE", 10);

        fc.registerBuyer(buyerAddress, "Con Sumer", "client location");
        var orderId = fc.putAnOrder("COFFEE", 10, 2000, buyerAddress);
        Assert.equal(orderId, 2, "Incorrect order id");

        //Run matching engine...
        fc.matchFarmersAndBuyers();
    }
}