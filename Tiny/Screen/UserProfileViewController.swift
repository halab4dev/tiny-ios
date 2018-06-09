//
//  UserProfileViewController.swift
//  Tiny
//
//  Created by halab on 5/28/18.
//  Copyright © 2018 halab. All rights reserved.
//

import UIKit

class UserProfileViewController: BaseViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var registerTimeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeStyle()
        initValue()
        sendGetUserDetailRequest()
    }
    
    func makeStyle() {
        changePasswordButton.layer.cornerRadius = 15.0
        logoutButton.layer.cornerRadius = 15.0
    }
    
    func initValue() {
        usernameLabel.text = UserService.getUserName()
    }
    
    func sendGetUserDetailRequest() {
        let userId: String = UserService.getUserId()
        showLoadingIcon()
        UserService.getUserInfo(userId: userId, successCallback: handleResponse, errorCallback: handleErrorResponse)
    }
    
    func handleResponse(_ userDetailResponse : UserDetailResponse) {
        hideLoadingIcon()
        registerTimeLabel.text = DateTimeService.toDateString(userDetailResponse.registerTime)
        emailLabel.text = userDetailResponse.email
    }
    
    @IBAction func goToChangePasswordScreen(_ sender: UIButton) {
        goToChangePasswordScreen()
    }
    
    func goToChangePasswordScreen() {
        performSegue(withIdentifier: "userProfileToChangePassword", sender: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        print("Logging out...")
        UserService.clearUserInfo()
        goToLoginScreen()
    }
    
    @IBAction func backFromChangePasswordScreen(segue: UIStoryboardSegue){
        print("Back from change password screen")
    }
}
