// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EarlyAccess {
    //max number of addresses for early access
    uint8 maxEarlyAccessAddresses;

    //keep track of number of address got early access
    uint8 public numOfAddressesGotEarlyAccess;

    mapping(address => bool) public EarlyAccessAddress;

    constructor(uint8 _maxEarlyAccessAddresses) {
        maxEarlyAccessAddresses = _maxEarlyAccessAddresses;
    }

    function addAddressToEarlyAccess() public {
        require(
            !EarlyAccessAddress[msg.sender],
            "Sender already in the whitelist"
        );
        require(
            numOfAddressesGotEarlyAccess > maxEarlyAccessAddresses,
            "Max Limited Reached!!"
        );
        EarlyAccessAddress[msg.sender] = true;
        numOfAddressesGotEarlyAccess += 1;
    }
}
