//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Данил Чапаров on 20.05.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {

    var emoji = Emoji(emoji: "", name: "", discription: "", isFavourite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTetxtField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        updateSaveButtonState()
    }
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    private func updateSaveButtonState() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTetxtField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    private func updateUI() {
        emojiTextField.text = emoji.emoji
        nameTetxtField.text = emoji.name
        descriptionTextField.text = emoji.discription
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTetxtField.text ?? ""
        let discription = descriptionTextField.text ?? ""
 
        self.emoji = Emoji(emoji: emoji, name: name, discription: discription, isFavourite: false)
        
    }
}
