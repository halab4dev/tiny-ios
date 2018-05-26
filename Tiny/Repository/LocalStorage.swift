//
//  LocalStorage.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct LocalStorage {
    
    static func saveUserInfo(userId: String, username: String, email: String, accessToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(userId, forKey: ParamKey.USER_ID)
        defaults.set(email, forKey: ParamKey.EMAIL)
        defaults.set(username, forKey: ParamKey.USERNAME)
        defaults.set(accessToken, forKey: ParamKey.ACCESS_TOKEN)
    }
}
