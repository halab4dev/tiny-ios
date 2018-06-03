//
//  LocalStorage.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct LocalStorage {
    
    static func clearUserInfo() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: ParamKey.USER_ID)
        defaults.removeObject(forKey: ParamKey.EMAIL)
        defaults.removeObject(forKey: ParamKey.USERNAME)
        defaults.removeObject(forKey: ParamKey.ACCESS_TOKEN)
    }
    
    static func getAccessToken() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: ParamKey.ACCESS_TOKEN) ?? ""
    }
    
    static func getUserId() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: ParamKey.USER_ID) ?? ""
    }
    
    static func saveUserInfo(userId: String, username: String, email: String, accessToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(userId, forKey: ParamKey.USER_ID)
        defaults.set(email, forKey: ParamKey.EMAIL)
        defaults.set(username, forKey: ParamKey.USERNAME)
        defaults.set(accessToken, forKey: ParamKey.ACCESS_TOKEN)
    }
    
    static func updateAccessToken(_ accessToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(accessToken, forKey: ParamKey.ACCESS_TOKEN)
    }
}
