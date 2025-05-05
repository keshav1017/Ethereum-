// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface
interface College {
    // Since interfaces can't have state variables in Solidity, 
    // we will provide getter functions to simulate this behavior
    function getCollegeName() external view returns (string memory);
    function getCollegeCode() external view returns (string memory);
    function display() external view returns (string memory, string memory);
}

// Base Contract: Department
contract Department {
    string public deptName;
    string public deptHead;

    function setDepartment(string memory _name, string memory _head) public {
        deptName = _name;
        deptHead = _head;
    }

    function getDepartment() public view returns (string memory, string memory) {
        return (deptName, deptHead);
    }
}

// Derived Contract: Student
contract Student is Department, College {
    string private collegeName = "Blockchain Institute";
    string private collegeCode = "BCI001";

    string public studentName;
    uint public regNo;
    uint public marks;

    function setStudent(string memory _sName, uint _regNo, uint _marks) public {
        studentName = _sName;
        regNo = _regNo;
        marks = _marks;
    }

    function getReportCard() public view returns (
        string memory, uint, uint, string memory, string memory, string memory, string memory
    ) {
        return (
            studentName,
            regNo,
            marks,
            deptName,
            deptHead,
            collegeName,
            collegeCode
        );
    }

    // Interface implementation
    function getCollegeName() public view override returns (string memory) {
        return collegeName;
    }

    function getCollegeCode() public view override returns (string memory) {
        return collegeCode;
    }

    function display() public view override returns (string memory, string memory) {
        return (collegeName, collegeCode);
    }
}
