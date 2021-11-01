pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "InterfaceGameObj.sol";

abstract contract GameObject is InterfaceGameObj {

    uint _lifes = 5;
    uint _defend = 0;
    address _addressAttacker;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveDefend(uint valueDefend) external {
        tvm.accept();
        _defend += valueDefend;
    }

    function acceptAttack(uint valueAttack) virtual override external  {
        tvm.accept();
        _addressAttacker = msg.sender;
    }

    function isKilled() private pure {
        msg.sender.transfer(0, true, 192);
    }

    modifier destruction(uint value) {
        require(value >= _defend);
        _;
    }
}