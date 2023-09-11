//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by DGF on 9/9/23.
//

import XCTest
@testable import NYCSchools

@MainActor
final class NYCSchoolsTests: XCTestCase {

    var sut: SchoolsViewModel<MockSchoolService>!
    var schools: MockSchoolService!
    
    override func setUpWithError() throws {
        schools = MockSchoolService()
        sut = SchoolsViewModel(service: schools)
    }
    
    func testSearchExistingSchoolShouldReturnOneResult()  {
        let schoolName = "Long Island City High School"
        sut.searchSchool = schoolName
        sut.search()
        XCTAssertEqual(sut.searchResults.count, 1)
        XCTAssertEqual(sut.searchResults.first!.schoolName, schoolName)
    }
    
}
