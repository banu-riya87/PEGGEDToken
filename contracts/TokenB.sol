pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";


contract TokenB is ERC20PresetMinterPauser  {
    constructor() public ERC20PresetMinterPauser('TNB', 'TNB'){
    }
    function mintToken(address to,uint amount) public 
    {
      mint(to,amount);
    }
    function burnToken(address to,uint amount) public 
    {
      _burn(to,amount);
    }
    
}