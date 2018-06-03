//
//  ViewController.swift
//  Tiny
//
//  Created by halab on 4/30/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailInput : UITextField!
    @IBOutlet weak var passwordInput : UITextField!
    @IBOutlet weak var loginButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeStyle()
    }
    
    func makeStyle() {
        emailInput.layer.cornerRadius = 15.0
        emailInput.layer.borderWidth = 0.5
        emailInput.layer.borderColor = UIColor.black.cgColor
        emailInput.becomeFirstResponder()
        
        passwordInput.layer.cornerRadius = 15.0
        passwordInput.layer.borderWidth = 0.5
        passwordInput.layer.borderColor = UIColor.black.cgColor
        
        loginButton.layer.cornerRadius = 15.0
    }

    @IBAction func login(_ sender: UIButton) {
        if(inputIsValid()) {
            sendLoginRequest(handleResponse)
        }
    }
    
    func sendLoginRequest(_ handleResponseFunction : @escaping(_ loginResponse : LoginResponse)->()) {
        let email: String = emailInput.text!
        let password: String = passwordInput.text!
        showLoadingIcon()
        UserService.login(email: email, password: password,
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
        let password: String = passwordInput.text!
        
        return validateRequireTextInput(email, Message.EMAIL_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(password, Message.PASSWORD_CAN_NOT_BE_EMPTY)
            && isValidPassword(password)
    }
    
    func goToTimelineScreen() {
        performSegue(withIdentifier: "loginScreenToHomeScreen", sender: nil)
    }
    
    @IBAction func goToRegisterScreen(_ sender: UIButton) {
        performSegue(withIdentifier: "firstScreenToRegisterScreen", sender: nil)
    }
    
    @IBAction func backFromRegisterScreen(segue: UIStoryboardSegue){
    }
}

