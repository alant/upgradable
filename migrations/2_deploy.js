const Implementation = artifacts.require("Implementation");
const Dollar = artifacts.require("Dollar");
const { deployProxy } = require('@openzeppelin/truffle-upgrades');
const Root = artifacts.require("Root");
const Upgradeable = artifacts.require("Upgradeable");

async function deployImplementation(deployer) {
  // await ESD.initialize();
  // await deployProxy(Implementation, [], {deployer, initializer: "initialize", unsafeAllowCustomTypes: true, unsafeAllowLinkedLibraries: true});
  // await deployer.deploy(Dollar);
  // await deployer.deploy(Upgradeable);
  await deployer.deploy(Implementation);
  await deployer.deploy(Dollar);
  const impl = await Implementation.deployed();
  await impl.setDollar(Dollar.address);
  await deployer.deploy(Root, Implementation.address);
  const hi = await impl.say42();
  console.log("=======> hi: " + hi);
}

module.exports = function(deployer) {
  deployer.then(async() => {
    console.log(deployer.network);
    switch (deployer.network) {
      case 'development':
      case 'rinkeby':
      case 'ropsten':
      case 'bsctestnet':
        await deployImplementation(deployer);
        break;
      case 'mainnet':
      case 'mainnet-fork':
        await deployImplementation(deployer);
        break;
      default:
        throw("Unsupported network");
    }
  })
};