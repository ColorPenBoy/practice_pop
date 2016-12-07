//
//  Client.swift
//  HXHPOPDemo
//
//  Created by 张强 on 2016/12/7.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation

/** 单独的类型来负责发送请求 */
protocol Client {
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
    
    var host: String { get }
}

struct URLSessionClient: Client {
    let host = "https://api.onevcat.com"
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
}

struct LocalFileClient: Client {
    
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        
        switch r.path {
        case "/users/onevcat":
            guard let fileURL = Bundle.main.url(forResource: "users-onevcat", withExtension: "") else {
                fatalError()
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError()
            }
            handler(T.Response.parse(data: data))
        default:
            fatalError("Unknown path")
        }
    }
    
    // 为了满足 `Client` 的要求，实际我们不会发送请求
    let host = ""
}
