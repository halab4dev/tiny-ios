//
//  RegisterViewController.swift
//  Tiny
//
//  Created by halab on 5/1/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeStyle()
    }
    
    func makeStyle() {
        emailInput.layer.cornerRadius = 15.0
        emailInput.layer.borderWidth = 0.5
        emailInput.layer.borderColor = UIColor.black.cgColor
        emailInput.becomeFirstResponder()
        
        usernameInput.layer.cornerRadius = 15.0
        usernameInput.layer.borderWidth = 0.5
        usernameInput.layer.borderColor = UIColor.black.cgColor
        
        passwordInput.layer.cornerRadius = 15.0
        passwordInput.layer.borderWidth = 0.5
        passwordInput.layer.borderColor = UIColor.black.cgColor
        
        confirmPasswordInput.layer.cornerRadius = 15.0
        confirmPasswordInput.layer.borderWidth = 0.5
        confirmPasswordInput.layer.borderColor = UIColor.black.cgColor
        
        registerButton.layer.cornerRadius = 15.0
    }
    
    func goToTimelineScreen() {
        performSegue(withIdentifier: "registerScreenToHomeScreen", sender: nil)
    }

    @IBAction func register(_ sender: UIButton) {
        if(inputIsValid()) {
            sendRegisterRequest(handleResponse)
        }
    }
    
    func sendRegisterRequest(_ handleResponseFunction : @escaping(_ loginResponse : LoginResponse)->()) {
        let email: String = emailInput.text!
        let username: String = usernameInput.text!
        let password: String = passwordInput.text!
        showLoadingIcon()
        UserService.register(email: email, username: username, password: password,
                             successCallback: handleResponseFunction, errorCallback: handleErrorResponse);
    }
    
    func handleResponse(_ loginResponse : LoginResponse) {
        UserService.saveUserInfo(userId: loginResponse.userId,username: loginResponse.username,
                                 email: loginResponse.email,accessToken: loginResponse.accessToken)
        hideLoadingIcon()
        goToTimelineScreen()
    }
    
    func inputIsValid() -> Bool {
        let email: String = emailInput.text!
        let username: String = usernameInput.text!
        let password: String = passwordInput.text!
        let confirmPassword: String = confirmPasswordInput.text!
        
        return validateRequireTextInput(email, Message.EMAIL_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(username, Message.USERNAME_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(password, Message.PASSWORD_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(confirmPassword, Message.CONFIRM_PASSWORD_CAN_NOT_BE_EMPTY)
            && validatePasswordInput(password, confirmPassword)
    }
    
    func validatePasswordInput(_ password: String, _ confirmPassword: String) -> Bool {
        return isValidPassword(password)
        && isValidPassword(confirmPassword)
        && isMatchedPassword(password, confirmPassword)
    }
    
    func isMatchedPassword(_ password : String, _ confirmPassword: String) -> Bool{
        if(password != confirmPassword) {
            showErrorMessage(Message.PASSWORD_NOT_MATCH)
            return false
        }
        return true
    }
}
