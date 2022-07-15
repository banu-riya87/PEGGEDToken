pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract TokenA is ERC20  {
    constructor() public ERC20('TNA', 'TNA'){
    _mint(msg.sender,100000000000);
    }
    
    
}