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
        
        // check if login was valid
        handleLogin()
    }

    // will check if username and password checks out
    private func handleLogin() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
    }

}

