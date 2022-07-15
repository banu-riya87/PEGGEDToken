Pegged coin to/from stable coin 

Smart Contracts:

PEGGEDToken.sol - Sample smartcontract to be begged from statble coin
TokenA.sol - ERC20 token (consider it as stable coin ERC20)
TokenA.sol - ERC20 token (consider it as begged coin ERC20)


Steps :

1) Deploy TokenA contract (Stable)
2) Deploy TokenB contract (Pegged)
3) Deploy PEGGEDToken and pass contructor argument as TokenA, TokenB contract addresses

4) Set Adminrole role and Minter role of TokenB coin as PEGGEDToken contract address

    function - grantRole(bytes32 role,address account)
    
    Example: 

    PEGGEDToken address - 0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc
    keccak256(DEFAULT_ADMIN_ROLE) - 0x1effbbff9c66c5e59634f24fe842750c60d18891155c32dd155fc2d661a4c86d
    keccak256(MINTER_ROLE) - 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6
  
    DEFAULT_ADMIN_ROLE - 
    grantRole("0x1effbbff9c66c5e59634f24fe842750c60d18891155c32dd155fc2d661a4c86d","0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc")

    MINTER_ROLE  - 
    grantRole("0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6","0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc")

    

5) Approve TokenA coin to PEGGEDToken contract address

    fucntion - approve(address spender,uint256 amount)

    Example
    PEGGEDToken address - 0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc
    approve("0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc", 1000)

6) Call getPEGToken fucntion of PEGGEDToken contract - This method transfer amount TokenA from msg.sender to PEGGEDToken contract  address, mint and sends 10 times ( minus fee) TokenB to the sender 

    fucntion - getPEGToken(uint amount)
    Example
    getPEGToken(1000)    //it should <= to the amount we approved in step 5

7) When user decided to get the original Token, Approve TokenB coin to PEGGEDToken contract address simillar to step 5

8) Call getOriginalToken fucntion to get the original coin - This method transfer amount of TokenB from msg.sender to PEGGEDToken contract  address, sends 1/10th times ( minus fee) TokenA to the sender and burn the TokenB tokens

    fucntion - getOriginalToken(uint amount)
    Example
    getOriginalToken(1000)    //it should <= to the amount we approved in step 7




