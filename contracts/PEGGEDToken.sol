pragma solidity ^0.8.0;

import  "@openzeppelin/contracts/utils/math/SafeMath.sol";
import  "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PEGGEDToken  {
  using SafeMath for uint;
    // USDT token
    IERC20 stableTokenAddress;

    TokenB pegTokenAdd;

    // !% fee for every PEG token mint and burn
    uint FEE = 1;

    constructor (address _stableTokenAddress, address _peggedTokenAddress  ) 
        {
            stableTokenAddress = IERC20(_stableTokenAddress);
            pegTokenAdd = TokenB(_peggedTokenAddress);

        }
    
    function getPEGToken(uint256 amount) public {
        // Transfer amount USDT tokens from msg.sender to contract
        stableTokenAddress.transferFrom(msg.sender, address(this), amount);

        uint fee = (((amount.mul(10**18)).mul(FEE)).div(10**2)).div(10**18);
        uint tempAmount = amount - fee;
        uint PEGToken = tempAmount.mul(10);

        // Mint tokens to msg.sender
        pegTokenAdd.mintToken(msg.sender,PEGToken);
    }

    function getOriginalToken (uint256 amount) public {
        // Transfer amount USDT tokens from msg.sender to contract
        pegTokenAdd.transferFrom(msg.sender, address(this), amount);
        
        uint tempAmount = ((amount.mul(10**18)).div(10)).div(10**18);
        uint fee = (((tempAmount.mul(10**18)).mul(FEE)).div(10**2)).div(10**18);
        uint Originaltoken = amount - fee;
        // Send amount tokens to msg.sender
        stableTokenAddress.transfer(msg.sender, Originaltoken);
        // Mint tokens to msg.sender
        pegTokenAdd.burnToken(msg.sender,amount);
    }

}
interface TokenB
{
    function mintToken(address to,uint amount) external;
    function burnToken(address to,uint amount) external;
    function transferFrom(address ,address,uint) external;
}