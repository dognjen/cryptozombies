pragma solidity ^0.4.19;

import "./ZombieFactory.sol";
import "./integrations/CryptoKitties.sol";

contract ZombieFeeding is ZombieFactory {

    address cryptoKittiesAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    KittyInterface kittyContract = KittyInterface(cryptoKittiesAddress);

    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);

        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;

        _createZombie("NoName", newDna);
    }

}