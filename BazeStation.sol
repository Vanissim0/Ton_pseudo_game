pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";

contract BazeStation is GameObject {

    uint _defend = 0;
    string[] public unitArray;
   
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveDefend(uint valueDefend) virtual external {
        tvm.accept();
        _defend += valueDefend;
    }

    function addUnit(address) external {
        tvm.accept();
        unitArray.push(address);
    }

    function deleteUnit(address) private {
        tvm.accept();
        delete unitArray(address);
    }

    function destruction() private {
        tvm.accept();
        this.transfer(true, 192);
    }
}

