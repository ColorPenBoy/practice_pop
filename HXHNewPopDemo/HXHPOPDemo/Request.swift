//
//  Request.swift
//  HXHPOPDemo
//
//  Created by 张强 on 2016/12/7.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation

/* 使用 POP 的方式从 URL 请求数据，并生成对应的 User */

enum HTTPMethod: String {
    case GET
    case POST
}

// Request仅仅需要定义请求入口和期望的响应类型
protocol Request {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    // Response遵循Decodable协议，保证所有的Response都可以对数据进行解析
    associatedtype Response : Decodable
    
}
