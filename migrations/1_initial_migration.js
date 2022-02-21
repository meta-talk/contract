const Migrations = artifacts.require("Migrations");
const MetaTalk = artifacts.require("MetaTalkContract");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(MetaTalk);
};
