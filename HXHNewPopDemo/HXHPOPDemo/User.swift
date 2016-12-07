//
//  User.swift
//  HXHPOPDemo
//
//  Created by 张强 on 2016/12/6.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
}

extension User: Decodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}


struct UserRequest: Request {
    typealias Response = User
    
    let name: String
    
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
}


