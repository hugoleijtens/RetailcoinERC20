const RetailcoinToken = artifacts.require("./RetailcoinToken.sol");

module.exports = function(deployer) {
  deployer.deploy(RetailcoinToken);
};
