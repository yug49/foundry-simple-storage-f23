 // SPDX-License-Identifier: MIT
pragma solidity 0.8.24; //solidity version
//>=0.8.18 <0.9.0; ---> for range of versions

contract SimpleStorage {
    // Basic Types: boolean, unit, unit, int, address, bytes
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 88;    // default values like in java, int ---> 0, bool ---> false
    string text = "eighty-eight";
    // address myAddress = 0x55816e65FFFc44aB44f70Fb0986d72CE2C096003;
    bytes32 public favoriteBytes32 = "cat";    // onny in this case bytes and bytes32 are different thing
    uint256[] listOfFavoriteNumbers; 

    struct Person {
        uint256 favNo;
        string Name;
    }

    // Person public pat = Person({
    //     favNo: 7,
    //     Name: "Pat"
    // });

    Person[] public listOfPeople;   // dynamic array ---> size can be modified || if [3], then max of size 3 (static array)

    mapping(string => uint256) public nameToFavNo;

    //default visibility is --> internal

    function store(uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
    }


    //view, pure ---> specifying it is read operation and have no txn so, minimal gas
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //calldata, memory, storage
    //calldata (no need of "") and memory means temporary variables
    //calldata cannot be modified
    //storage permanent vairable cannot be modified --> default
    function addPerson(string memory _name, uint256 _favNo) public {
        // Person memory newPerson = Person(_favNo, _name);
        // listOfPeople.push(newPerson);

        listOfPeople.push(Person(_favNo, _name));  
        nameToFavNo[_name] = _favNo;                      
    }
}
