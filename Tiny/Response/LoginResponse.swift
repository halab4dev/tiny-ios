//
//  LoginResponse.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    
    var userId : String
    var email : String
    var username: String
    var accessToken: String
    
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
}
