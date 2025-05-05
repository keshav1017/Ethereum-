// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Base Contract
contract Vehicle {
    string public make;
    string public model;
    uint public year;
    string public fuelType;

    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType) {
        make = _make;
        model = _model;
        year = _year;
        fuelType = _fuelType;
    }

    // Virtual functions to be overridden
    function calculateFuelEfficiency() public view virtual returns (string memory) {}
    function getDistanceTraveled(uint fuelUsed) public view virtual returns (uint) {}
    function getMaxSpeed() public view virtual returns (uint) {}
}

contract Truck is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function calculateFuelEfficiency() public pure override returns (string memory) {
        return "5 km/l (heavy duty)";
    }

    function getDistanceTraveled(uint fuelUsed) public pure override returns (uint) {
        return fuelUsed * 5;
    }

    function getMaxSpeed() public pure override returns (uint) {
        return 120;
    }
}

contract Car is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function calculateFuelEfficiency() public pure override returns (string memory) {
        return "15 km/l (standard)";
    }

    function getDistanceTraveled(uint fuelUsed) public pure override returns (uint) {
        return fuelUsed * 15;
    }

    function getMaxSpeed() public pure override returns (uint) {
        return 180;
    }
}

contract Motorcycle is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function calculateFuelEfficiency() public pure override returns (string memory) {
        return "40 km/l (high)";
    }

    function getDistanceTraveled(uint fuelUsed) public pure override returns (uint) {
        return fuelUsed * 40;
    }

    function getMaxSpeed() public pure override returns (uint) {
        return 160;
    }
}
