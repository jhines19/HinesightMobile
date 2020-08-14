//
//  SignUpViewController.swift
//  MobileHinesight
//
//  Created by Jaraad Hines on 8/13/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {

    @IBOutlet weak var
    firstNameTextField:
    UITextField!
    
    @IBOutlet weak var
    lastNameTextField:
    UITextField!
    
    @IBOutlet weak var
    emailTextField:
    UITextField!
    
    @IBOutlet weak var
    passwordTextField:
    UITextField!
    
    @IBOutlet weak var
    signUpButton:
    UIButton!
    
    @IBOutlet weak var
    errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
    
    //Hide the error label
        errorLabel.alpha = 0
        
    //Style the elements
        Utilities.styleTextField(textfield: firstNameTextField)
        Utilities.styleTextField(textfield: lastNameTextField)
        Utilities.styleTextField(textfield: emailTextField)
        Utilities.styleTextField(textfield: passwordTextField)
        Utilities.styleFilledButton(button: signUpButton)
    }

    //Check the fields and validate that the data is correct. If correct, method returns nil. Otherwise, it returns error message
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        //Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password: cleanedPassword) == false {
            //Password isnt secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        //Add valid email check regular expression in utilities file and do method here later
        
        return nil
    }
    
    @IBAction func
    signUPTapped(
        sender: Any){
    
    //Validate the fields
    let error = validateFields()
    
        if error != nil {
            
            //There's something wrong with the fields, show error message
            showError(message: error!)
        }
    
        //Create cleaned versions of the data
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
    //Create the user
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
    //Check for errors
            if err != nil {
                
                //There was an error creating the user
                self.showError(message: "Error creating user")
            }
            else{
                //User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["firstname":firstName,"lastname":lastName, "uid": result!.user.uid]) { (error) in
                    
                    if error != nil {
                        //show error message
                        self.showError(message: "Error saving user data")
                    }
                }
                 //Transition to the home screen
                self.transitionToHome()
                
            }
        }
   
        
    
    }
    
    func showError( message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
       
        let homeViewController =
    storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
        HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
