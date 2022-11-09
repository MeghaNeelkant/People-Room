//
//  ViewControllerTests.swift
//  PeopleAppUITests
//
//  Created by Megha Uppin on 09/11/2022.
//

import XCTest

class ViewControllerTests: XCTestCase {

    var app : XCUIApplication!
    override func setUpWithError() throws {
        
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()

      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testHomeScreenCollectionViewExists() {
        let collectionViews = app.collectionViews
    
        
        XCTAssertNotNil(collectionViews.firstMatch)
    }

    
    func testNavigatesToPeopleScreen() {
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.staticTexts["People"].tap()
        
       
        let texts =  app.navigationBars["People"].staticTexts
         
         XCTAssertEqual(texts.firstMatch.label, "People")
    }
    
    
    func testNavigatesToRoomsScreen() {
        
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.staticTexts["Room"].tap()
        
        let texts =  app.navigationBars["Room"].staticTexts
         
         XCTAssertEqual(texts.firstMatch.label, "Room")
       
    }
 

   
}
