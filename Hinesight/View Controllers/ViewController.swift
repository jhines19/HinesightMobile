//
//  ViewController.swift
//  MobileHinesight
//
//  Created by Jaraad Hines on 8/13/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var
    signUpButton:
    UIButton!
    
    @IBOutlet weak var
    loginButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(button: signUpButton)
        Utilities.styleHollowButton(button: loginButton)
        
    }
        
}
