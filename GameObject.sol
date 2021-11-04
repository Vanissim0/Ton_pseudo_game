pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "InterfaceGameObj.sol";

abstract contract GameObject is InterfaceGameObj {

    uint _lifes = 5;
    uint _defend;
    address _addressAttacker;
    uint _valueAttack;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveDefend(uint valueDefend) external {
        tvm.accept();
        _defend = valueDefend;
    }

    function acceptAttack(uint valueAttack) virtual override external  {
        tvm.accept();
        _valueAttack = valueAttack;
        _addressAttacker = msg.sender;
    }

    function isKilled(address _addressAttacker) internal pure destruction{
        tvm.accept();
        _addressAttacker.transfer(0, true, 160);
    }

    modifier destruction() {
        require(_valueAttack >= _lifes + _defend);
        _;
    }
}