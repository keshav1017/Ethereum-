// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRanking {
    struct Student {
        uint roll;
        string name;
        uint marksInPhysics;
        uint marksInChemistry;
        uint marksInMathematics;
        uint totalMarks;
    }

    Student[] public students;

    // Add a student and calculate total marks
    function addStudent(
        uint _roll,
        string memory _name,
        uint _physics,
        uint _chemistry,
        uint _maths
    ) public {
        uint total = _physics + _chemistry + _maths;
        students.push(Student(_roll, _name, _physics, _chemistry, _maths, total));
    }

    // Sort students in-place in descending order of total marks
    function sortStudentsByMarks() public {
        uint n = students.length;
        for (uint i = 0; i < n; i++) {
            for (uint j = i + 1; j < n; j++) {
                if (students[j].totalMarks > students[i].totalMarks) {
                    Student memory temp = students[i];
                    students[i] = students[j];
                    students[j] = temp;
                }
            }
        }
    }

    // Get sorted student list
    function getAllStudents() public view returns (Student[] memory) {
        return students;
    }

    // Get number of students
    function getStudentCount() public view returns (uint) {
        return students.length;
    }
}
