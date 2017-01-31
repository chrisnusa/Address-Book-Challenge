//
//  Address_Book_ChallengeTests.swift
//  Address Book ChallengeTests
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import XCTest
@testable import Address_Book_Challenge

class Address_Book_ChallengeTests: XCTestCase {
    
    var testUserJSON = RandomUserApiManager.getRandomUserURL()
    var testData: Data!
    
    override func setUp() {
        super.setUp()
        if let file = Bundle(for:Address_Book_ChallengeTests.self).path(forResource: "TestUser", ofType: "json") {
            self.testData = try? Data(contentsOf: URL(fileURLWithPath: file))
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetURL()
    {
        XCTAssert(String(describing: self.testUserJSON!) == "https://randomuser.me/api/?results=1", "The message is not correct")
        testUserJSON = RandomUserApiManager.getRandomUserURL(source: 5)
        XCTAssert(String(describing: self.testUserJSON!) == "https://randomuser.me/api/?results=5", "The message is not correct")
    }
    
    func testRandomUserData()
    {
        let json = JSON(data:self.testData)
        let resultArray = json["results"].arrayValue[0]
        let testUser = RandomUserData(randomUserJSON: resultArray)
        
        XCTAssertEqual(testUser.name, resultArray["name"]["first"].stringValue + " " + resultArray["name"]["last"].stringValue)
        XCTAssertEqual(testUser.address, resultArray["location"]["street"].stringValue)
        XCTAssertEqual(testUser.city, resultArray["location"]["city"].stringValue)
        XCTAssertEqual(testUser.email, resultArray["email"].stringValue)
        XCTAssertEqual(testUser.mediumPictureURL, resultArray["picture"]["medium"].URL)
        XCTAssertEqual(testUser.largePictureURL, resultArray["picture"]["large"].URL)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        XCTAssertEqual(testUser.dateOfBirth, dateFormatter.date(from: resultArray["dob"].stringValue))

    }
}
