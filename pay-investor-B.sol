// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 1. Create a constructor function which can allocate an initial payable value to the contract upon deplayment. 
// 2. Create a function called payout which explicity prohibits outside visibility in the strict sense. 
// 3. Write a for loop in the function that iterates over all the wallets of the investors.
// 4. While iterating through the wallets the loop should return a transfers of ethers equal to the amounts in each walet.
// (hint: You need to transfer into the investorWallet by checking each investor address matched up to investorWallets of the index)
// 5. Write a function called makePayment which can then execute the payout function once deployed. 

contract AddressWallets{ 
    
    address owner;
    uint value;
    
    constructor() payable{
        owner = msg.sender;
        value = msg.value;
    }
    
    address payable[] investorWallets;
    mapping (address => uint) investors;
    
    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }
    
    modifier mustBeOwner{
        require(msg.sender == owner, "You are not authourized");
        _;
    }
    
    function payInvestors(address payable _investorWallets , uint amounts) public mustBeOwner {
        investorWallets.push(_investorWallets);
        investors[_investorWallets] = amounts;
    }
    
    function payOut() private{
        for(uint i=0; i < investorWallets.length; i++){
            investorWallets[i].transfer(investors[investorWallets[i]]);
        }
    }
    
    function makePayment() public mustBeOwner{
        payOut();
    }
}


