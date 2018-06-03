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
    
    static func clearUserInfo() {
        LocalStorage.clearUserInfo();
    }
    
    static func getUserId() -> String {
        return LocalStorage.getUserId()
    }
    
    /// Call API Login
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
    
    static func saveUserInfo(userId: String, username: String, email: String, accessToken: String){
        LocalStorage.saveUserInfo(userId: userId, username: username, email: email, accessToken: accessToken);
    }
    
    static func updateAccessToken(accessToken: String) {
        LocalStorage.updateAccessToken(accessToken)
    }
    
}
