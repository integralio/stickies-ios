//
//  StickiesUITests.swift
//  StickiesUITests
//
//  Created by Stefan on 9/14/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import XCTest

class StickiesUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    // MARK: -
    // MARK: Test Cases

    func testDisplaysWelcomeLabelOnAppLaunch() {
        let app = XCUIApplication()

        // Ensure there is a welcome label
        let labelQuery = app.descendants(matching: .staticText)
            .matching(identifier: "welcomeLabel")
        let labelElement = labelQuery.element
        XCTAssertTrue(labelElement.exists)
        XCTAssertTrue(labelElement.isHittable)
    }

    func testStickyNoteTextIsNotVisibleOnAppLaunch() {
        let app = XCUIApplication()

        let query = getNewStickyLabelElementQuery(from: app)
        XCTAssertEqual(query.count, 0)
    }

    func testUserCanEnterAndSaveStickyContent() {
        let app = XCUIApplication()

        // Find the button
        let buttonQuery = app.descendants(matching: .any)
            .matching(identifier: "createSticky")
        let buttonElement = buttonQuery.element
        XCTAssertTrue(buttonElement.exists)
        buttonElement.tap()

        // Find the text field
        let inputTextFieldQuery = app.descendants(matching: .textField)
            .matching(identifier: "stickyTextInput")
        let inputTextFieldElement = inputTextFieldQuery.element
        XCTAssertTrue(inputTextFieldElement.exists)

        // Type some text
        let desiredText = UUID().uuidString
        inputTextFieldElement.typeText(desiredText)

        // Hit OK
        let okButtonQuery = app.descendants(matching: .button)
            .matching(identifier: "OK")
        let okButtonElement = okButtonQuery.element
        okButtonElement.tap()

        // Verify what we entered got put in the new sticky
        let result = getNewStickyLabelElementQuery(from: app).element
        XCTAssertTrue(result.exists)
        XCTAssertTrue(result.isHittable)
    }
    
}

// MARK: -
// MARK: Test Helpers

extension StickiesUITests {

    func getNewStickyLabelElementQuery(from app: XCUIApplication) -> XCUIElementQuery {
        return app.descendants(matching: .staticText)
            .matching(identifier: "newStickyLabel")
    }

}
