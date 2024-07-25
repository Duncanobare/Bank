//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.13;
contract Bank{
    address admin;
    uint256 amount;
    struct User{
        address addr;
        string name;
        uint256 age;
        uint256 balance;
    }
    User[] public usersArray;
    mapping(address => User) public mapUser;

    modifier onlyAdmin{
require(msg.sender == admin,"not the admin");
_;
    }
    function createAccount(address _addr, string memory _name, uint256 _age) public{
        User storage Us = mapUser[_addr];
        Us.addr = _addr;
        Us.name = _name;
        Us.age = _age;
        Us.balance = 0;
     usersArray.push(Us);
    }
 function deposit(address _addr, uint256 _amount) public payable returns (uint256){
    User storage Us = mapUser[_addr];
    amount = msg.value;
    Us.addr = _addr;
    amount = _amount;
    require(_amount >0 ,"amount must be greater than 0");
    _addr.transfer(_amount);
    Us.balance += _amount;
    return Us.balance;
 }
 function withdraw(address _addr, uint256 _amount) public payable returns (uint256){
    User storage Us = mapUser[_addr];
    amount = msg.value;
    Us.addr= _addr;
    amount = _amount;
    require(_amount >0 ,"amount must be greater than 0");
    Us.balance -= _amount;
    return Us.balance;
 }
 function viewUsers() public view returns (uint256){
    return usersArray.length;
 }
}
