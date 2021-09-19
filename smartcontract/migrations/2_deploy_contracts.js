const TodoContract = artifacts.require("TodoContract");

module.exports = function (deployer) {
  deployer.deploy(TodoContract);
};
