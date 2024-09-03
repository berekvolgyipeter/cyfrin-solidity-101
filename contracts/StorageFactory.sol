// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageContracts;

    function createSimpleStorageContract() public {
        // new = deploys the contract and returns its address
        // implicit type conversion: address -> SimpleStorage
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageContracts.push(simpleStorage);
    }

    // to access a contract we need 2 things:
    // ABI - Abstract Binary Interface
    // address
    function sfStore(uint256 _idx, uint256 _favoriteNumber) public {
        // SimpleStorage(address(simpleStorageContracts[_idx])).store(_favoriteNumber);
        simpleStorageContracts[_idx].store(_favoriteNumber);
    }

    function sfGet(uint256 _idx) public view returns (uint256) {
        // return simpleStorageContracts(address(simpleStorageArray[_idx])).retrieve();
        return simpleStorageContracts[_idx].retrieve();
    }
}
