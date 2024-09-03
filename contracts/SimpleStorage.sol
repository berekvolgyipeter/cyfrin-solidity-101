// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// pragma solidity ^0.8.0;  // compatible versions: [0.8.0, 0.9.0[
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    Person[] public listOfPeople;

    // mapping(string name => uint256 number) - we can also name the mapping types
    mapping(string => uint256) public nameToFavoriteNumber;

    // virtual = this function can be modified by child contracts
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // storage:
    //     Data stored permanently on the blockchain.
    //     Variables declared at the contract level (state variables) are stored in storage.
    // memory:
    //     Temporary data storage used only during the execution of a function.
    //     Data stored in memory is erased between (external) function calls.
    // stack:
    //     Temporary storage for local variables during execution.
    //     It has a very limited size and is not directly accessible to developers.

    // quick tip: use memory for complex objects: struct, array, mapping...
    // (string and bytes are also arrays)
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}
