//
//  HomeViewController.swift
//  LoginWithFirebaseApp
//
//  Created by 伏谷亮弥 on 2021/08/20.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 10
        
    }
}
