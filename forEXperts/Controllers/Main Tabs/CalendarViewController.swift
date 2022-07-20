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
        display()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // function to display LoginViewController in viewDidLoad
    private func display() {
        // creating an instance of LoginViewController with the storyboard identifier
        guard let loginVC = storyboard?.instantiateViewController(identifier: "Login") as? LoginViewController else {
            print("failed")
            return
        }
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }

}

