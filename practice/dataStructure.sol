pragma solidity ^0.5.11;

contract SampleContract {
    
    //Vaiable Types
    
    //1. fixed-size types    
        bool isReady; //true or false
        uint a; // unsigned integer
        address recipient; // use to store address of receiver/contract when sending ether
        bytes32 data; // can be use for fixed length strings
    
    //2. variable-size types
        string name; // string
        bytes _data; //same as bytes32 but no pre fixed length
        uint[10] balance; // Array - datatypes must be same for all data
        mapping(uint => string) users; //Associative Array
        
    //3. user-defined
        struct Student{
            string name;
            address sdtAddress;
            bool hasBSDegree;
            uint[] subjects;
        } //Similar as js objects
        
        enum gender {male , female} //Same as enum in mysql

        //we can also define access modifiers with variables - Solidity consider private by default if not defined
        
        //public - all can access
        // Note: when we define public variable, solidity automatically creates the function with the same name 

        //external - Cannot be accessed internally, only externally
    
        //internal - only this contract and contracts deriving from it can access
    
        //private - can be accessed only from this contract
        
}