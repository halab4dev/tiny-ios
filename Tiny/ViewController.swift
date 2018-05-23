//
//  ViewController.swift
//  Tiny
//
//  Created by halab on 4/30/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: UIButton) {
        print("Login button clicked")
    }
    
    @IBAction func goToRegisterScreen(_ sender: UIButton) {
        print("Go to register screen")        
        performSegue(withIdentifier: "firstScreenToRegisterScreen", sender: nil)
    }
    
    @IBAction func backFromRegisterScreen(segue: UIStoryboardSegue){
        print("Back from register screen")
    }
}

