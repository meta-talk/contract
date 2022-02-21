// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MetaTalkContract {
    // storage nodes. When some user want to use MetaTalk
    mapping(address => string) public Recipients;
    mapping(address => bool) public Recipients_Flag;
    address[] public Recipients_Map;

    receive() external payable {}

    function setStorageNode(string memory domain) external {
        if(!Recipients_Flag[msg.sender]) {
            Recipients_Flag[msg.sender] = true;
            Recipients_Map.push(msg.sender);
        }
        Recipients[msg.sender] = domain;
    }

    function getAllRecipients() external view returns(address[] memory) {
        return Recipients_Map;
    }

    function getStorageNode(address owner) public view returns(string memory) {
        return Recipients[owner];
    }
}

/*

truffle migrate --reset --network development
truffle console --network development
const c = await MetaTalkContract.deployed();
await c.setStorageNode('storage.metatalk.services');
await c.getAllRecipients();
await c.getStorageNode(accounts[0]);

*/