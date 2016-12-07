//
//  Request.swift
//  HXHOldPopDemo
//
//  Created by 张强 on 2016/12/7.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response
    
    func parse(data: Data) -> Response?

}

extension Request {
    func send(handler: @escaping (Response?) -> Void) {
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // 在示例中我们不需要 `httpBody`，实践中可能需要将 parameter 转为 data
        // request.httpBody = ...
        
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            // 处理结果
            if let data = data, let res = self.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
}

struct UserRequest: Request {
    
    let name: String
    
    let host: String = "https://api.onevcat.com"
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    
    typealias Response = User
    
    func parse(data: Data) -> User? {
        return User(data: data)
    }
}
