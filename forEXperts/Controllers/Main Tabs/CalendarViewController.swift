//
//  ViewController.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        display()
    }
    
    private func display() {
        // creating an instance of LoginViewController with the storyboard identifier
        guard let loginVC = storyboard?.instantiateViewController(identifier: "Login") as? LoginViewController else {
            print("failed")
            return
        }
        
        // checking if username and password match
        if !loginVC.validLogin {
            print("while loop going")
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

}

