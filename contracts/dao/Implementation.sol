/*
    Copyright 2020 Empty Set Squad <emptysetsquad@protonmail.com>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "./Permission.sol";
import "./Upgradeable.sol";
import "../Constants.sol";
//import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

contract Implementation is Setters, Permission, Upgradeable {
    using SafeMath for uint256;
    int public y;

    event Advance(uint256 indexed epoch, uint256 block, uint256 timestamp);
    event Incentivization(address indexed account, uint256 amount);

    function initialize() initializer public {
        // Reward committer
        incentivize(msg.sender, Constants.getAdvanceIncentive());
//        dollar().sayHi();
        // Dev rewards

    }

    function incentivize(address account, uint256 amount) private {
        // mintToAccount(account, amount);
        // dollar().mint(account, amount);
        //  y = dollar().sayHi();
//        y = 42;
        emit Incentivization(account, amount);
    }

    function say42() public returns (int) {
        y = dollar().sayHi();
        return y;
    }
}
