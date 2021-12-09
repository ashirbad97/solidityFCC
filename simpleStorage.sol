// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {
    // this will get intiitalized to 0
    uint256 favouriteNumber;
    // Think of llike defining a class
    struct People {
        uint256 favouriteNumber;
        string name;
        string surName;
    }
    // Think of like an instance of the class
    People public person = People({
        favouriteNumber:9,
        name:"Ashirbad",
        surName:"Samantaray"
    });
    // Declaring a fixed-size array of datatype People 
    // People[1] public people;
    // Declaring a dynamic array of datatype People
    People[] public people;
    // Declaring a mapping 
    mapping(string => uint256) public nameToFavouriteNumber;
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
    // Don't do any state change, return the current state
    function retrieveView() public view returns(uint256) {
        return favouriteNumber;
    }
    // Don't do any state change, does a computation
    function retrievePure(uint256 favNumber) public pure {
        favNumber + favNumber;
    }

    function AddPerson(string memory _name, uint256 _favouriteNumber, string memory _surName) public {
    // Old way to pass
    //    people.push(People({
    //         favouriteNumber:_favouriteNumber,
    //         name:_name,
    //         surName:_surName
    //     }));

    // Not necessary to do in the previous way
    people.push(People(_favouriteNumber,_name,_surName));
    }

    function AddMapping(string memory _name, uint256 _favouriteNumber) public {
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
