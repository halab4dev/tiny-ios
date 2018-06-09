//
//  UserDetailResponse.swift
//  Tiny
//
//  Created by halab on 6/9/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct UserDetailResponse: Decodable {
    
    var userId: String
    var username: String
    var email: String
    var registerTime: Int64
    var avatarUrl: String
}
