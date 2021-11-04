pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";

contract BazeStation is GameObject {

    uint _defend;
    address[] public unitArray;
   
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function recieveDefend(uint valueDefend) virtual external override{
        tvm.accept();
        _defend = valueDefend;
    }

    function addUnit(address _unitAddress) external {
        tvm.accept();
        unitArray.push(_unitAddress);
    }

    function deleteUnit(uint unitNumber) private {
        tvm.accept();
        delete unitArray[unitNumber];
    }

    function destruction(address dest) internal {
        tvm.accept();
        dest.transfer(0, true, 160);
    }
}

