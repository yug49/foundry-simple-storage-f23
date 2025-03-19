// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import {SimpleStorage} from "../src/simpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns(SimpleStorage) {
        vm.startBroadcast(); //vm cheatcodes only valid in foundry and will not work on other solidity frameworks
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
