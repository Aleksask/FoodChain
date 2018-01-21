var FoodChain = artifacts.require("./FoodChain.sol");

module.exports = function(deployer) {
  deployer.deploy(FoodChain);
};