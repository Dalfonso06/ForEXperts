//
//  ViewController.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
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
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("selected")
    }
    
}

