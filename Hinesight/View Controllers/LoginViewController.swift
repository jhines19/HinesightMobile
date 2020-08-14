//
//  LoginViewController.swift
//  MobileHinesight
//
//  Created by Jaraad Hines on 8/13/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var
    emailTextField:
    UITextField!
    
    @IBOutlet weak var
    passwordTextField:
    UITextField!
    
    @IBOutlet weak var
    loginButton: UIButton!
    
    @IBOutlet weak var
    errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        }
        
        func setUpElements() {
        
        // Hide the error Label
            errorLabel.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(textfield: emailTextField)
        Utilities.styleTextField(textfield: passwordTextField)
        Utilities.styleFilledButton(button: loginButton)
            
        }
    
    

@IBAction func loginTapped( sender: Any) {
    
    //Validate Text Fields: preety much same as sign up view controller
    
    //Create cleaned versions of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    //Signing in the user
    Auth.auth().signIn(withEmail: email, password: password) {
        (result, error) in
        
        if error != nil {
            // Couldn't sign in
            self.errorLabel.text = error!.localizedDescription
            self.errorLabel.alpha = 1
        }
        else {
            
            let homeViewController =
                self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
                HomeViewController
                
            self.view.window?.rootViewController = homeViewController
            self.view.window?.makeKeyAndVisible()
        }
}
}
}
