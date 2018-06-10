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
    @IBOutlet weak var avatarImageView: UIImageView!
    
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
        
        
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.blue.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        avatarImageView.clipsToBounds = true
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
        let avatarUrl = "https://scontent.fhan4-1.fna.fbcdn.net/v/t1.0-1/c25.0.320.320/p320x320/1011991_497523130321886_2042482780_n.jpg?_nc_cat=0&oh=9238ebc6d5cfa78459b48092c1b38c59&oe=5BBB3826"
        loadImage(imageUrl: avatarUrl, imageView: avatarImageView)
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
