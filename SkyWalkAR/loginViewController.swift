//
//  loginViewController.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 02/11/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController,  UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func alert(title:String, Message:String, button1:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let button1 = UIAlertAction(title: button1, style: .default) { (true) in
            self.emailTextField.becomeFirstResponder()
        }
        
        alert.addAction(button1)
        present(alert, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func loginButtonPressed(_ sender: Any){
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            
            guard let email = emailTextField.text else { return }
            guard let password = passwordTextField.text else { return }
            
            
            Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
                if error == nil{
                    //pass to the next using the segue identifier
                }
                else{
                    print("Error: \(String(describing: error!))")
                    
                    self.alert(title: "Something is Fishy! 🤔", Message: "Did you miss some field or is the password wrong?", button1: "Check to continue.")
                    
                }
            }
            
        }
        
        
        
        
    }

}
