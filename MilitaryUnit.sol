pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'GameObject.sol';
import 'BazeStation.sol';

contract MilitaryUnit is GameObject {
    
    uint _attack = 0;
    uint _defend = 0;

    constructor() BazeStation(address) public {
        tvm.accept();
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        addUnit();
    }

    function Attack(address) private {
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

    function destruction1() private {
        tvm.accept();
        this.transfer(true, 192);
    }

    function destructionFromBase() private {
        tvm.accept();
        require(msg.pubkey == BazeStation.address);
    }
}
