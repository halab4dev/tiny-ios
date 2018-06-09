//
//  UserService.swift
//  Tiny
//
//  Created by halab on 5/12/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UserService {
    
    static let SESSION = "sessions/"
    static let USERS = "users/"
    static let PASSWORD = "/passwords/"
    
    /// Call API `Change Password`
    static func changePassword(userId: String, oldPassword: String, newPassword: String,
                               successCallback : @escaping(_ changePasswordResponse: ChangePasswordResponse)->Void,
                               errorCallback: @escaping(_ errorCode: Int)->Void){
        let requestUrl = ServerAddress.SERVER_ADDRESS + USERS + userId + PASSWORD
        let requestData : Dictionary<String,Any> = [
            ParamKey.OLD_PASSWORD : oldPassword,
            ParamKey.NEW_PASSWORD : newPassword
        ]
        API.call(url: requestUrl, method: HTTPMethod.put, data: requestData, type: ChangePasswordResponse.self,
                 successCallback: successCallback, errorCallback: errorCallback)
        
    }
    
    /// Clear user info in local storage
    static func clearUserInfo() {
        LocalStorage.clearUserInfo();
    }
    
    /// Get user id from local storage
    static func getUserId() -> String {
        return LocalStorage.getUserId()
    }
    
    /// Call API `Get User Info`
    static func getUserInfo(userId: String,
                            successCallback : @escaping(_ loginResponse: UserDetailResponse)->Void,
                            errorCallback: @escaping(_ errorCode: Int)->Void) {
        let requestUrl = ServerAddress.SERVER_ADDRESS + USERS + userId
        API.call(url: requestUrl, method: HTTPMethod.get, data: nil, type: UserDetailResponse.self,
                 successCallback: successCallback, errorCallback: errorCallback)
    }
    
    /// Get user name from local storage
    static func getUserName() -> String {
        return LocalStorage.getUserName()
    }
    
    /// Call API `Login`
    static func login(email: String, password: String,
                      successCallback : @escaping(_ loginResponse: LoginResponse)->Void,
                      errorCallback: @escaping(_ errorCode: Int)->Void) {
        let requestUrl = ServerAddress.SERVER_ADDRESS + SESSION
        let requestData : Dictionary<String,Any> = [
            ParamKey.EMAIL : email,
            ParamKey.PASSWORD : password
        ]
        API.call(url: requestUrl, method: HTTPMethod.post, data: requestData, type: LoginResponse.self,
                 successCallback: successCallback, errorCallback: errorCallback)
    }
    
    
    /// Call API `Register`
    static func register(email: String, username: String, password: String,
                         successCallback : @escaping(_ loginResponse: LoginResponse)->Void,
                         errorCallback: @escaping(_ errorCode: Int)->Void){
        let requestUrl = ServerAddress.SERVER_ADDRESS + USERS
        let requestData : Dictionary<String,Any> = [
            ParamKey.EMAIL : email,
            ParamKey.USERNAME : username,
            ParamKey.PASSWORD : password
        ]
        API.call(url: requestUrl, method: HTTPMethod.post, data: requestData, type: LoginResponse.self,
                 successCallback: successCallback, errorCallback: errorCallback)
    }
    
    /// Save user info in local storage
    static func saveUserInfo(userId: String, username: String, email: String, accessToken: String){
        LocalStorage.saveUserInfo(userId: userId, username: username, email: email, accessToken: accessToken);
    }
    
    /// Update access token in local storage
    static func updateAccessToken(accessToken: String) {
        LocalStorage.updateAccessToken(accessToken)
    }
    
}
