pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'GameObject.sol';
import 'BazeStation.sol';
import 'InterfaceGameObj.sol';

contract MilitaryUnit is GameObject {
    
    uint _attack;
    uint _defend;

    constructor() BazeStation(address) public {
        tvm.accept();
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        addUnit();
    }

    function Attack(InterfaceGameObj _addressAttacker) virtual public {
        tvm.accept();
        _addressAttacker.acceptAttack(valueAttack);
    }

    function recieveAttack(uint valueAttack) virtual external {
        tvm.accept();
        _attack = valueAttack;
    }

    function recieveDefend(uint valueDefend) virtual external {
        tvm.accept();
        _defend = valueDefend;
    }

    function destruction1() private {
        tvm.accept();
        this.transfer(true, 160);
    }

    function destructionFromBase() private {
        tvm.accept();
        require(msg.sender == BazeStation.address);
    }
}
