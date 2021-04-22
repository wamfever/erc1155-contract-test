pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KeykoTest is ERC1155, Ownable {
    string public name;
    string public symbol;
    mapping(address => bool) public isWhitelisted;

    modifier onlyWhitelisted() {
        require(
            isWhitelisted[msg.sender] == true,
            "User not whitelisted for minting"
        );
        _;
    }

    constructor(
        string memory name_,
        string memory symbol_,
        string memory _url
    ) ERC1155(_url) {
        name = name_;
        symbol = symbol_;
    }

    function mintTokens(
        address account,
        uint256 id,
        uint256 amount
    ) public onlyWhitelisted {
        _mint(account, id, amount, "");
    }

    //only owner can add whitelist accounts
    function addWhitelist(address whitelisted) external onlyOwner {
        isWhitelisted[whitelisted] = true;
    }

    //only owner can remove whitelist accounts
    function removeWhitelist(address whitelisted) external onlyOwner {
        isWhitelisted[whitelisted] = false;
    }

    //everyone can burn their own tokens
    function burnTokens(uint256 id, uint256 amount) external {
        _burn(msg.sender, id, amount);
    }
}
