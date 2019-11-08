//
//  ViewController.swift
//  Multiple Screens!
//
//  Created by Bo Yan on 10/30/19.
//  Copyright © 2019 Bo Yan. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var contact: Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        nameTextField.tag = 1
        phoneNumberTextField.delegate = self
        phoneNumberTextField.tag = 2
        
        if let contact = contact {
            navigationItem.title = contact.name
            nameLabel.text = contact.name
            phoneNumberLabel.text = contact.phoneNumber
            photoImageView.image = contact.photo
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let addMode = presentingViewController is UINavigationController
        if addMode{
            dismiss(animated: true, completion: nil)
        }
        else if let back = navigationController{
            back.popViewController(animated: true)
        }
        else{
            fatalError("The ContactsViewController is not inside a navigation controller.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameTextField.text ?? ""
        let phoneNumber = phoneNumberTextField.text ?? ""
        let photo = photoImageView.image
        
        contact = Contacts(name: name, phoneNumber: phoneNumber, photo: photo)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(nameTextField.isFirstResponder){
            phoneNumberTextField.becomeFirstResponder()
        }else{
            nameTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.tag == 1){
            if(textField.text != ""){
                nameLabel.text = textField.text
            }
        }else{
            if(textField.text != ""){
                phoneNumberLabel.text = textField.text
            }
        }
        navigationItem.title = nameLabel.text
    }
    
}

