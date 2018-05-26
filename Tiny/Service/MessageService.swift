//
//  MessageService.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct MessageService {
    
    static let MESSAGE_MAP : [Int: String] = [
        ResponseCode.EMAIL_REGISTERED           :   Message.EMAIL_REGISTERED,
        ResponseCode.INCORRECT_EMAIL_OR_PASSWORD: Message.INCORRECT_EMAIL_OR_PASSWORD,
        ResponseCode.INTERNAL_SERVER_ERROR      :   Message.INTERNAL_SERVER_ERROR
    ]
    
    static func getMessage(errorCode : Int) -> String {
        return MESSAGE_MAP[errorCode] ?? "Unknow Error: \(errorCode)"
    }
}
