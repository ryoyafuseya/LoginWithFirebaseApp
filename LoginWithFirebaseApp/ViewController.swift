//
//  ViewController.swift
//  LoginWithFirebaseApp
//
//  Created by 伏谷亮弥 on 2021/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.isEnabled = false
        registerButton.layer.cornerRadius = 10
        registerButton.backgroundColor = UIColor.rgb(red: 255, green: 221, blue: 187)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func showKeyboard(notification: Notification) {
        let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as
                                AnyObject).cgRectValue
        
        guard let keyboardMinY = keyboardFrame?.minY else {return}
        let registerButtonMaxY = registerButton.frame.maxY
        let distance = registerButtonMaxY - keyboardMinY + 20
        
        let transform = CGAffineTransform(translationX: 0, y: -distance)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.view.transform = transform
        })
//        print("keyboardMinY: ", keyboardMinY, "registerButtonMaxY: ", registerButtonMax)
    }
    
    @objc func hideKeyboard() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.view.transform = .identity
        })
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
        let usernameIsEmpty = usernameTextField.text?.isEmpty ?? true
        
        if emailIsEmpty || passwordIsEmpty || usernameIsEmpty {
            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor.rgb(red: 255, green: 221, blue: 187)
        } else {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor.rgb(red: 255, green: 141, blue: 0)
        }
        
    }
}
