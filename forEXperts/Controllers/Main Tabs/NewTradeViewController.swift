//
//  NewTradeViewController.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import UIKit

class NewTradeViewController: UIViewController {

    @IBOutlet var currency: UIPickerView!
    
    @IBOutlet weak var unitAmount: UITextField!
    
    let data = ["Bitcoin", "USD", "EUR", "Etherium", "GHB"] // use for the picker view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currency.dataSource = self
        currency.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sellPressed(_ sender: Any) {
        print("sold \(unitAmount.text ?? "") units")
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        print("bought \(unitAmount.text ?? "") units")
    }

}

extension NewTradeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

extension NewTradeViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
