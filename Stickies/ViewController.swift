//
//  ViewController.swift
//  Stickies
//
//  Created by Stefan on 9/14/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -
    // MARK: Properties and UI

    @IBOutlet weak var createStickyButton: UIBarButtonItem?

    /// The label shown when the application launches.
    @IBOutlet weak var welcomeLabel: UILabel?

    @IBOutlet weak var stickyLabel: UILabel?

    /// The yellow square parent of `stickyLabel`.
    @IBOutlet weak var stickyPaper: UIView?

    // MARK: -
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: -
    // MARK: Actions

    /// Called when the user selects the "+" button to create a new sticky note.
    @IBAction func didSelectCreateASticky(_ sender: UIBarButtonItem) {
        createStickyTextInputAlert()
    }

}

// MARK: -
// MARK: Public Methods

extension ViewController {
    
    /// Hook up accessibility identifiers and set initial state.
    func setupView() {
        createStickyButton?.accessibilityIdentifier = "createSticky"
        welcomeLabel?.accessibilityIdentifier = "welcomeLabel"
        stickyLabel?.accessibilityIdentifier = "newStickyLabel"

        stickyPaper?.isHidden = true
    }

    // MARK: -
    // MARK: Actions

    /// This method does the following:
    /// * Creates an alert (using the `UIAlertController` API)
    /// * Adds an "OK" button with a handler that sets the text of the sticky note
    /// * Shows the alert on the screen
    func createStickyTextInputAlert() {
        var newNoteInputField: UITextField?
        let alertController = UIAlertController(
            title: "New Sticky Note",
            message: "Enter some text for your new sticky note.",
            preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            self.stickyLabel?.text = newNoteInputField?.text
            self.stickyPaper?.isHidden = false
        }
        alertController.addAction(ok)
        alertController.addTextField { (textField) in
            // Capture a reference
            newNoteInputField = textField
            // Allows the UI test to be able to enter into the text field
            textField.accessibilityIdentifier = "stickyTextInput"
        }
        present(alertController, animated: true, completion: nil)
    }

}
