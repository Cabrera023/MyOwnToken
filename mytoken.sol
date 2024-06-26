// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyOwntoken is ERC20 {
    address public owner; // Declare owner variable
    uint256 private _totalSupply;

    constructor() ERC20("MICHAELA", "MCHL") {
        owner = msg.sender; // Assign the deployer of the contract as the owner
        _mint(msg.sender, 6000000 * 6 ** decimals()); // Mint 6,000,000 tokens initially
        _totalSupply = 6000000 * 6** decimals();
    }

    function mint(address _to, uint256 _amount) public returns (bool success) {
        require(msg.sender == owner, "Only the owner can mint tokens");
        
        _mint(_to, _amount);
        _totalSupply += _amount;
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        _burn(msg.sender, _amount);
        _totalSupply -= _amount;
        return true;
    }

    function transfer(address _to, uint256 _value) public override returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}
