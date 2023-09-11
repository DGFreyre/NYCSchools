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
    
    func testSearch()  {
        let text = "Long Island City High School"
        sut.searchSchool = text
        sut.search()
        XCTAssertEqual(sut.searchResults.count, 1)
        XCTAssertEqual(sut.searchResults.first!.schoolName, text)
    }
    
}
