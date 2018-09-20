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
    // MARK: Properties / UI

    /// The label that displays the 'add a note' message, during an empty state.
    @IBOutlet var emptyStateLabel: UILabel?

    /// The actual label that displays the note text.
    @IBOutlet var noteLabel: UILabel?

    /// The view that represents the "paper" background of the sticky note.
    @IBOutlet var notePaperView: UIView?

    /// The add bar button item, to create a new note.
    @IBOutlet var addBarButton: UIBarButtonItem?

    /// The delete bar button item, to delete an existing note.
    @IBOutlet var deleteBarButton: UIBarButtonItem?

    /// The new note input text field (assigned a value when the user taps add '+').
    var newNoteInputField: UITextField?

    /// The edit note input text field (assigned a value when the user taps the 'i' to edit).
    var editNoteInputField: UITextField?

    // MARK: -
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        updateStickyNoteVisibility()
        updateNavBarButtons()
    }

    func setupView() {
        noteLabel?.text = ""
        addBarButton?.accessibilityIdentifier = "stickyAddButton"
        deleteBarButton?.accessibilityIdentifier = "stickyDeleteButton"
    }

    // MARK: -
    // MARK: Sticky Note Handling

    /// Updates the visibility of the sticky note paper, based upon if the sticky note has text or not.
    func updateStickyNoteVisibility() {
        notePaperView?.isHidden = noteLabel?.text?.isEmpty ?? true
    }

    /// Updates the bar button items based upon if the user has created a sticky note or not.
    func updateNavBarButtons() {
        if noteLabel?.text?.isEmpty ?? true {
            navigationItem.rightBarButtonItem = addBarButton
        } else {
            navigationItem.rightBarButtonItem = deleteBarButton
        }
    }

    // MARK: -
    // MARK: Actions

    /// Called when the user has tapped the add '+' nav bar button.
    @IBAction func didSelectAddButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(
            title: "New Sticky Note",
            message: "Enter some text for your new sticky note.",
            preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            self.noteLabel?.text = self.newNoteInputField?.text
            self.updateStickyNoteVisibility()
            self.updateNavBarButtons()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        alertController.addAction(ok)
        alertController.addTextField { (textField) in
            self.newNoteInputField = textField
            textField.accessibilityIdentifier = "stickyTextInput"
        }
        present(alertController, animated: true, completion: nil)
    }

    /// Called when the user taps the 'i' to edit the note.
    @IBAction func didSelectEditButton(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Edit Sticky Note",
            message: "Enter some new text for your sticky note.",
            preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            self.noteLabel?.text = self.editNoteInputField?.text
            self.updateStickyNoteVisibility()
            self.updateNavBarButtons()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        alertController.addAction(ok)
        alertController.addTextField { (textField) in
            self.editNoteInputField = textField
            textField.text = self.noteLabel?.text
            textField.accessibilityIdentifier = "stickyTextInput"
        }
        present(alertController, animated: true, completion: nil)
    }

    /// Called when the user selects the trash can 'delete' nav bar button.
    @IBAction func didSelectDeleteButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(
            title: "Delete Note?",
            message: "Are you sure you want to delete this note?",
            preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .destructive) { (_) in
            self.noteLabel?.text = ""
            self.updateStickyNoteVisibility()
            self.updateNavBarButtons()
        }
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(no)
        alertController.addAction(yes)
        present(alertController, animated: true, completion: nil)
    }

}

