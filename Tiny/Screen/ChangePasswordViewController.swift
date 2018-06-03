//
//  ChangePasswordViewController.swift
//  Tiny
//
//  Created by halab on 5/28/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class ChangePasswordViewController: BaseViewController {

    @IBOutlet weak var oldPasswordInput: UITextField!
    @IBOutlet weak var newPasswordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeStyle()
    }

    func makeStyle() {
        oldPasswordInput.layer.cornerRadius = 15.0
        oldPasswordInput.layer.borderWidth = 0.5
        oldPasswordInput.layer.borderColor = UIColor.black.cgColor
        oldPasswordInput.becomeFirstResponder()
        
        newPasswordInput.layer.cornerRadius = 15.0
        newPasswordInput.layer.borderWidth = 0.5
        newPasswordInput.layer.borderColor = UIColor.black.cgColor
        
        confirmPasswordInput.layer.cornerRadius = 15.0
        confirmPasswordInput.layer.borderWidth = 0.5
        confirmPasswordInput.layer.borderColor = UIColor.black.cgColor
        
        saveButton.layer.cornerRadius = 15.0
    }
    
    @IBAction func changePassword(_ sender: UIButton) {
        print("Change password button clicked")
        if(inputIsValid()) {
            sendChangePasswordRequest(handleResponse)
        }
    }
    
    func sendChangePasswordRequest(_ handleResponseFunction : @escaping(_ loginResponse : ChangePasswordResponse)->()) {
        let oldPassword: String = oldPasswordInput.text!
        let newPassword: String = newPasswordInput.text!
        let userId: String = UserService.getUserId()
        showLoadingIcon()
        UserService.changePassword(userId: userId, oldPassword: oldPassword, newPassword: newPassword,
                             successCallback: handleResponseFunction, errorCallback: handleErrorResponse);
    }
    
    func handleResponse(_ changePasswordResponse : ChangePasswordResponse) {
        hideLoadingIcon()
        showSuccessMessage()
        UserService.updateAccessToken(accessToken: changePasswordResponse.accessToken)
    }
    
    private func showSuccessMessage() {
        let alertController = UIAlertController(title: title, message:
            Message.CHANGE_PASSWORD_SUCCESSFULLY, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler:  { action in
            self.backToProfileScreen()
        }))
        self.present(alertController, animated: true, completion: nil)        
    }
    
    func backToProfileScreen() {
        performSegue(withIdentifier: "backToProfileScreen", sender: nil)
    }
    
    func inputIsValid() -> Bool {
        let oldPassword: String = oldPasswordInput.text!
        let newPassword: String = newPasswordInput.text!
        let confirmPassword: String = confirmPasswordInput.text!
        
        return validateRequireTextInput(oldPassword, Message.PASSWORD_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(newPassword, Message.PASSWORD_CAN_NOT_BE_EMPTY)
            && validateRequireTextInput(confirmPassword, Message.CONFIRM_PASSWORD_CAN_NOT_BE_EMPTY)
            && validatePasswordInput(oldPassword, newPassword, confirmPassword)
    }
    
    func validatePasswordInput(_ oldPassword: String, _ newPassword: String, _ confirmPassword: String) -> Bool {
        return isValidPassword(oldPassword)
            && isValidPassword(newPassword)
            && isValidPassword(confirmPassword)
            && isMatchedPassword(newPassword, confirmPassword)
    }
    
    func isMatchedPassword(_ password : String, _ confirmPassword: String) -> Bool{
        if(password != confirmPassword) {
            showErrorMessage(Message.PASSWORD_NOT_MATCH)
            return false
        }
        return true
    }
}
