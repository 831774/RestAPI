import XCTest

import RestAPITests

var tests = [XCTestCaseEntry]()
tests += RestAPITests.allTests()
XCTMain(tests)