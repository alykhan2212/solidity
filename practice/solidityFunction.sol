 pragma solidity ^0.5.11;
 
 contract MyContract {
     
    uint value;
    
    function getVal() external view returns(uint){
        return value;
    } 
    
    function setVal(uint _val) external{
        value = _val;
    } 
    
    //view - view keyword use for view only not to modify function
    
    //public - all can access

    //external - Cannot be accessed internally, only externally
    
    //internal - only this contract and contracts deriving from it can access
    
    //private - can be accessed only from this contract
 
     
 }