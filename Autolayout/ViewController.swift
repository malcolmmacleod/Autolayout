//
//  ViewController.swift
//  Autolayout
//
//  Created by Malcolm Macleod on 19/07/2015.
//  Copyright (c) 2015 Malcolm Macleod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure = false {
        didSet {
            updateUI()
        }
    }
    
    var loggedInUser : User? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        self.passwordField.secureTextEntry = secure
        self.passwordLabel.text = secure ? "Secured Password" : "Password"
        self.nameLabel.text = loggedInUser?.name
        self.companyLabel.text = loggedInUser?.company
        imageView.image = loggedInUser?.image
    }
    @IBAction func toggleSecurity() {
        self.secure = !self.secure
    }
    
    @IBAction func login() {
        loggedInUser = User.login(self.loginField.text ?? "", password: self.passwordField.text ?? "")
    }
}

extension User {
    var image : UIImage? {
        if let image = UIImage(named: login) {
            return image
        } else {
            return UIImage (named: "unknown_user")
        }
    }
}

