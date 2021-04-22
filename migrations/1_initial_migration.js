const KeykoTest = artifacts.require("KeykoTest.sol");

module.exports = function (deployer) {
  deployer.deploy(KeykoTest,"KeykoTestERC1155","KYK","http://mbntech.ro/nft/");
};
