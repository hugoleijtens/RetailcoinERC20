pragma solidity ^0.4.24;

import "./ERC20.sol";
import "./Ownable.sol";
import "./StandardToken.sol";

/**
 * @title RetailcoinToken
 * @dev The RetailcoinToken, very simple ERC20 Token implementation, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `StandardToken` functions.
 */
contract RetailcoinToken is Ownable, StandardToken {

  string public constant name = "Retailcoin"; // solium-disable-line uppercase
  string public constant symbol = "XRTC"; // solium-disable-line uppercase
  uint8 public constant decimals = 8; // solium-disable-line uppercase

  uint256 public constant INITIAL_SUPPLY = 7000000000 * (10 ** uint256(decimals));

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    emit Transfer(address(0), msg.sender, INITIAL_SUPPLY);
  }

  function() public payable {
    revert();
  }

  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20(tokenAddress).transfer(owner, tokens);
  }

}