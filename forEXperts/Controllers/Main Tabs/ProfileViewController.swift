//
//  ProfileViewController.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    let image = UIImage(named: "no-user-img")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileName.text = APP_DEL.userFirstName + " " + APP_DEL.userLastName
        profilePic.image = image
    }
    
    
    
    
}
