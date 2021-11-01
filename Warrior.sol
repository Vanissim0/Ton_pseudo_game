pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'MilitaryUnit.sol';

contract Warrior is MilitaryUnit {
    
    uint _defend = 0;
    uint _attack = 0;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveAttack(uint valueAttack) virtual external {
        tvm.accept();
        _attack += valueAttack;
    }

    function recieveDefend(uint valueDefend) virtual external {
        tvm.accept();
        _defend += valueDefend;
    }

}
