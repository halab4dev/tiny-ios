//
//  ResponseCode.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct ResponseCode {

    //Response code from server
    static let SUCCESS = 200
    
    static let EMAIL_REGISTERED = 410
    
    static let INTERNAL_SERVER_ERROR = 500
    
    //Self define code
    static let PARSE_JSON_ERROR = -400
}
