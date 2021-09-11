// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract NoobToken {
    
    //Identifiers
    string  public  _name;
    string  public  _symbol;
    address public  _creator;
    uint    private _totalSupply;
    
    //Mappings
    mapping(address => uint) private balances;
    
    //Events
    event Transfer(address sender, address receiver, uint amount);

    //Error handling
    error InsufficientBalance(uint requested, uint available);
    
    constructor() {
        _name = "NoobCoin";
        _symbol = "NBC";
        _totalSupply = 1000;
        _creator = msg.sender;
        
        //Mint totalSupply tokens 
        balances[_creator] = _totalSupply;
        emit Transfer(address(0), _creator, _totalSupply);
    }
    
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
    
    
    function burn(uint amount) public{
        if(amount <= balances[msg.sender]){
            balances[msg.sender] -= amount;
            balances[address(0)] += amount;
        }else{
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
    }
    
    
    function transfer(address receiver, uint amount) public {
        require(msg.sender != receiver, "You can't transfer tokens to yourself");
        
        if (amount <= balances[msg.sender]){
            balances[msg.sender] -= amount;
            balances[receiver] += amount;
            emit Transfer(msg.sender, receiver, amount);
        }else{
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
    }
    
    function checkBalance() public view returns (uint balance) {
        return balances[msg.sender];
    }
}
