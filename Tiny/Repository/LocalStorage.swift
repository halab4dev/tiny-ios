//
//  LocalStorage.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct LocalStorage {
    
    static func saveUserInfo(loginResponse: LoginResponse) {
        let defaults = UserDefaults.standard
        defaults.set(loginResponse.userId, forKey: ParamKey.USER_ID)
        defaults.set(loginResponse.email, forKey: ParamKey.EMAIL)
        defaults.set(loginResponse.username, forKey: ParamKey.USERNAME)
        defaults.set(loginResponse.accessToken, forKey: ParamKey.ACCESS_TOKEN)
    }
}
