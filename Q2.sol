// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibrarySystem {
    struct Book {
        string name;
        string author;
        string publisher;
        uint price;
        string branch; // e.g., fiction, biography, thrillers
    }

    Book[] public books;

    // Add a new book
    function addBook(
        string memory _name,
        string memory _author,
        string memory _publisher,
        uint _price,
        string memory _branch
    ) public {
        books.push(Book(_name, _author, _publisher, _price, _branch));
    }

    // Get all books by a specific publisher
    function getBooksByPublisher(string memory _publisher) public view returns (Book[] memory) {
        uint count = 0;

        // First pass: count matching books
        for (uint i = 0; i < books.length; i++) {
            if (compareStrings(books[i].publisher, _publisher)) {
                count++;
            }
        }

        // Second pass: collect matching books
        Book[] memory result = new Book[](count);
        uint j = 0;
        for (uint i = 0; i < books.length; i++) {
            if (compareStrings(books[i].publisher, _publisher)) {
                result[j] = books[i];
                j++;
            }
        }

        return result;
    }

    // Get all books in a specific branch
    function getBooksByBranch(string memory _branch) public view returns (Book[] memory) {
        uint count = 0;

        // First pass: count matching books
        for (uint i = 0; i < books.length; i++) {
            if (compareStrings(books[i].branch, _branch)) {
                count++;
            }
        }

        // Second pass: collect matching books
        Book[] memory result = new Book[](count);
        uint j = 0;
        for (uint i = 0; i < books.length; i++) {
            if (compareStrings(books[i].branch, _branch)) {
                result[j] = books[i];
                j++;
            }
        }

        return result;
    }

    // Helper function to compare strings
    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
}
