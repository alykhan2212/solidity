// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 1. Create a contract called AddressWallets which wraps around the function checkInvestors below.
// 2. Create an empty array of addresses which is payable called investorWallets
// 3. Write a libaray of keys and values nameed investors where the keys are addresses and the values are integers. 
// 4. Write a payable function called payInvestors which takes the parameters address and amount.
// 5. Write logic in the function so that it can add new wallets to investorWallets and fill them with amounts of your choosing. 

contract AddressWallets{ 
    
    address payable[] investorWallets;
    mapping (address => uint) investors;
    
    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }
    
    function payInvestors(address payable _investorWallets , uint amounts) public {
        investorWallets.push(_investorWallets);
        investors[_investorWallets] = amounts;
    }
}
