// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// Library with utility functions
library MathLib {
    
    function max(uint a, uint b) internal pure returns (uint) {
        return a >= b ? a : b;
    }

    function min(uint a, uint b) internal pure returns (uint) {
        return a <= b ? a : b;
    }

    function factorial(uint n) internal pure returns (uint) {
        require(n <= 20, "Input too large"); // Prevent overflow
        uint result = 1;
        for (uint i = 2; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    function fibonacci(uint n) internal pure returns (uint[] memory) {
        require(n > 0 && n <= 100, "Out of range");

        uint[] memory series = new uint[](n);
        series[0] = 0;
        if (n > 1) {
            series[1] = 1;
        }
        for (uint i = 2; i < n; i++) {
            series[i] = series[i - 1] + series[i - 2];
        }
        return series;
    }

    function isArmstrong(uint num) internal pure returns (bool) {
        uint original = num;
        uint sum = 0;
        uint digits = 0;
        uint temp = num;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        temp = num;
        while (temp != 0) {
            uint digit = temp % 10;
            uint power = 1;
            for (uint i = 0; i < digits; i++) {
                power *= digit;
            }
            sum += power;
            temp /= 10;
        }

        return sum == original;
    }
}

contract MathVerifier {
    using MathLib for uint;

    function getMax(uint a, uint b) public pure returns (uint) {
        return MathLib.max(a, b);
    }

    function getMin(uint a, uint b) public pure returns (uint) {
        return MathLib.min(a, b);
    }

    function getFactorial(uint n) public pure returns (uint) {
        return MathLib.factorial(n);
    }

    function getFibonacci(uint n) public pure returns (uint[] memory) {
        return MathLib.fibonacci(n);
    }

    function checkArmstrong(uint num) public pure returns (bool) {
        return MathLib.isArmstrong(num);
    }
}

