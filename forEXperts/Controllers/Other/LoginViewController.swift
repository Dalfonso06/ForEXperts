//
//  LoginViewController.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var validLogin = false;
    
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        print("Login button pressed")
        for person in APP_DEL.users {
            if (person.loginName == userText.text && person.password == passwordText.text) {
                dismiss(animated: true, completion: nil)
                print("Valid Login")
                APP_DEL.userLastName = person.lastName
                APP_DEL.userFirstName = person.firstName
                validLogin = true
                break
            } else {
                userText.text = ""
                passwordText.text = ""
                print("Login Failed")
            }
        }
    }
    
}
