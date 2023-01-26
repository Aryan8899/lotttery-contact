// lottery contact!!!!

pragma solidity ^0.4.17;


contract Lottery{
    address public managar;
    address[] public players;


    constructor() public {
        managar = msg.sender;
    }

    function enter() public payable{
    require(msg.value > .01 ether);


     players.push(msg.sender);
    }
   
  function random() private view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty,now, players)));
    }
    function pickwinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address[](0);
         }
    modifier restricted(){
          require(msg.sender == managar);
          _;
    }

    function getarray() public view returns(address[]){
        return players;
    }

}