// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Employee {
    string public name;
    address public addr;
    uint public salary;
    string public jobTitle;

    constructor(string memory _name, address _addr, uint _salary, string memory _jobTitle) {
        name = _name;
        addr = _addr;
        salary = _salary;
        jobTitle = _jobTitle;
    }

    function calculateBonus() public view virtual returns (uint) {
        // Base bonus is 10%
        return salary / 10;
    }

    function generatePerformanceReport() public view virtual returns (string memory) {
        return string(abi.encodePacked(jobTitle, " ", name, " has satisfactory performance."));
    }

    function manageProject() public view virtual returns (string memory) {
        return string(abi.encodePacked(jobTitle, " ", name, " is managing basic project tasks."));
    }
}

contract Manager is Employee {
    constructor(string memory _name, address _addr, uint _salary)
        Employee(_name, _addr, _salary, "Manager") {}

    function calculateBonus() public view override returns (uint) {
        return salary * 20 / 100; // 20% bonus
    }

    function manageProject() public view override returns (string memory) {
        return string(abi.encodePacked("Manager ", name, " is overseeing multiple departments."));
    }
}

contract Developer is Employee {
    constructor(string memory _name, address _addr, uint _salary)
        Employee(_name, _addr, _salary, "Developer") {}

    function calculateBonus() public view override returns (uint) {
        return salary * 15 / 100; // 15% bonus
    }

    function manageProject() public view override returns (string memory) {
        return string(abi.encodePacked("Developer ", name, " is building smart contracts."));
    }
}

contract Programmer is Employee {
    constructor(string memory _name, address _addr, uint _salary)
        Employee(_name, _addr, _salary, "Programmer") {}

    function calculateBonus() public view override returns (uint) {
        return salary * 12 / 100; // 12% bonus
    }

    function manageProject() public view override returns (string memory) {
        return string(abi.encodePacked("Programmer ", name, " is writing backend code."));
    }
}

