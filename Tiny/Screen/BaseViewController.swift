//
//  BaseViewController.swift
//  Tiny
//
//  Created by halab on 5/6/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        activityIndicatorView.center = self.view.center
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicatorView)
    }
    
    func showLoadingIcon() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingIcon() {
        UIApplication.shared.endIgnoringInteractionEvents()
        activityIndicatorView.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToLoginScreen() {        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "loginScreen") as! LoginViewController
        self.present(loginViewController, animated: false, completion: nil)
    }
    
    func validateRequireTextInput(_ text: String, _ message: String) -> Bool {
        if(text.isEmpty){
            showErrorMessage(message)
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        if(password.count < Constant.MIN_PASSWORD_LENGTH) {
            showErrorMessage(Message.INVALID_PASSWORD)
            return false
        }
        return true
    }
    
    func handleErrorResponse(_ errorCode: Int) {
        hideLoadingIcon()
        let message = MessageService.getMessage(errorCode: errorCode)
        showErrorMessage(message)
    }
    
    func showErrorMessage(_ message: String) {
        showMessage(title: "Error", message: message)
    }
    
    func showSuccessMessage(_ message : String) {
        showMessage(title: "Success", message: message)
    }
    
    private func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
