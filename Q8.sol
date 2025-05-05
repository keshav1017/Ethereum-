// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Calculator Library
library CalcLib {
    function add(int a, int b) external pure returns (int) {
        return a + b;
    }

    function subtract(int a, int b) external pure returns (int) {
        return a - b;
    }

    function multiply(int a, int b) external pure returns (int) {
        return a * b;
    }

    function divide(int a, int b) external pure returns (int) {
        require(b != 0, "Division by zero");
        return a / b;
    }

    function modulo(uint a, uint b) external pure returns (uint) {
        require(b != 0, "Modulo by zero");
        return a % b;
    }

    function sqrt(uint x) external pure returns (uint) {
        if (x == 0) return 0;
        uint z = (x + 1) / 2;
        uint y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    function abs(int x) external pure returns (uint) {
        return uint(x >= 0 ? x : -x);
    }

    function power(uint base, uint exp) external pure returns (uint) {
        uint result = 1;
        for (uint i = 0; i < exp; i++) {
            result *= base;
        }
        return result;
    }
}

// Main Calculator Contract
contract Calculator {
    function performAdd(int a, int b) public pure returns (int) {
        return CalcLib.add(a, b);
    }

    function performSub(int a, int b) public pure returns (int) {
        return CalcLib.subtract(a, b);
    }

    function performMul(int a, int b) public pure returns (int) {
        return CalcLib.multiply(a, b);
    }

    function performDiv(int a, int b) public pure returns (int) {
        return CalcLib.divide(a, b);
    }

    function performMod(uint a, uint b) public pure returns (uint) {
        return CalcLib.modulo(a, b);
    }

    function getSqrt(uint x) public pure returns (uint) {
        return CalcLib.sqrt(x);
    }

    function getAbs(int x) public pure returns (uint) {
        return CalcLib.abs(x);
    }

    function getPower(uint base, uint exp) public pure returns (uint) {
        return CalcLib.power(base, exp);
    }
}
