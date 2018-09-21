//
//  ViewController.swift
//  Stickies
//
//  Created by Stefan on 9/14/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var newNoteInputField: UITextField?

    @IBOutlet weak var newNoteLabel: UILabel?

    @IBOutlet weak var createStickyButton: UIBarButtonItem?

    @IBOutlet weak var welcomeLabel: UILabel?

    @IBOutlet weak var stickyLabel: UILabel?

    @IBOutlet weak var stickyPaper: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        createStickyButton?.accessibilityIdentifier = "createSticky"
        welcomeLabel?.accessibilityIdentifier = "welcomeLabel"
        stickyLabel?.accessibilityIdentifier = "newStickyLabel"

        stickyPaper?.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didSelectCreateASticky(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(
            title: "New Sticky Note",
            message: "Enter some text for your new sticky note.",
            preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            self.newNoteLabel?.text = self.newNoteInputField?.text
            self.stickyPaper?.isHidden = false
        }
        alertController.addAction(ok)
        alertController.addTextField { (textField) in
            self.newNoteInputField = textField
            textField.accessibilityIdentifier = "stickyTextInput"
        }
        present(alertController, animated: true, completion: nil)
    }

}

