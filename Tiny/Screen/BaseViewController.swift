//
//  BaseViewController.swift
//  Tiny
//
//  Created by halab on 5/6/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func handleErrorResponse(_ errorCode: Int) {
        let message = MessageService.getMessage(errorCode: errorCode)
        showErrorMessage(message)
    }

}
