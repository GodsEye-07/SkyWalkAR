//
//  signupViewController.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 02/11/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import Firebase

class signupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailtextField.delegate = self
        passwordTextFIeld.delegate = self
        confirmPasswordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailtextField{
            passwordTextFIeld.becomeFirstResponder()
        }else if textField == passwordTextFIeld{
            confirmPasswordTextField.becomeFirstResponder()
        }else if textField == confirmPasswordTextField{
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        guard let email = emailtextField.text else { return }
        guard let password = passwordTextFIeld.text else { return }
        guard let confirmpassword = confirmPasswordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password){user, error in
            if error == nil && user != nil{
                
                let userId = Auth.auth().currentUser?.uid
                print("User created with uid: \(String(describing: userId!))")
                
                
                _ = Database.database().reference().child("User/profile details/\(String(describing: userId!))").setValue(email)
                
            }
            else {
                
                print("the error is : \(String(describing: error!.localizedDescription))")
                
                let alert = UIAlertController(title: "There is some error 🧐", message: "Mabe check the credentials again!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }

}
