// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Department {
    function getDepartmentDetails() external view returns (string memory, string memory);
    function printDepartmentDetails() external view returns (string memory);
}

contract Hostel {
    string public hostelName;
    string public hostelLocation;
    uint public numberOfRooms;

    function setHostelDetails(string memory _name, string memory _location, uint _rooms) public {
        hostelName = _name;
        hostelLocation = _location;
        numberOfRooms = _rooms;
    }

    function getHostelDetails() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }

    function printHostelDetails() public view returns (string memory) {
        return string(abi.encodePacked("Hostel Name: ", hostelName, ", Location: ", hostelLocation, ", Rooms: ", uint2str(numberOfRooms)));
    }

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) return "0";
        uint j = _i;
        uint len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}

contract Student is Hostel, Department {
    struct StudentData {
        string studentName;
        string regdNo;
        string electiveSubject;
        uint avgMarks;
        string deptName;
        string deptHead;
    }

    mapping(string => StudentData) private students;

    function getData(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead
    ) public {
        students[_regdNo] = StudentData(_studentName, _regdNo, _electiveSubject, _avgMarks, _deptName, _deptHead);
    }

    function printData(string memory _regdNo) public view returns (string memory) {
        StudentData memory s = students[_regdNo];
        if (bytes(s.regdNo).length == 0) return "Student not found";

        return string(
            abi.encodePacked(
                "Name: ", s.studentName,
                ", Regd No: ", s.regdNo,
                ", Elective: ", s.electiveSubject,
                ", Avg Marks: ", uint2str(s.avgMarks),
                ", Dept: ", s.deptName,
                ", Dept Head: ", s.deptHead
            )
        );
    }

    function getDepartmentDetails() external pure override returns (string memory, string memory) {
        // This function is for demonstration; details are returned by printData
        return ("", "");
    }

    function printDepartmentDetails() external pure override returns (string memory) {
        return "Implemented in printData() based on student record.";
    }
}

contract StudentDriver {
    Student public studentContract;

    constructor() {
        studentContract = new Student();
    }

    function admitStudent(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead
    ) public {
        studentContract.getData(_studentName, _regdNo, _electiveSubject, _avgMarks, _deptName, _deptHead);
    }

    function getStudentDetails(string memory _regdNo) public view returns (string memory) {
        return studentContract.printData(_regdNo);
    }
}
