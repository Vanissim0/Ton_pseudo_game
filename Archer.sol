pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'MilitaryUnit.sol';

contract Archer is MilitaryUnit {

    uint _defend;
    uint _attack;
    uint static public numberArcher;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveAttack(uint valueAttack) virtual external {
        tvm.accept();
        _attack = valueAttack;
    }

    function recieveDefend(uint valueDefend) virtual external {
        tvm.accept();
        _defend = valueDefend;
    }

}
