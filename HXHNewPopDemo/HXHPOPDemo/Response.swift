//
//  Response.swift
//  HXHPOPDemo
//
//  Created by 张强 on 2016/12/7.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import Foundation

/** 解析网络数据 -> Model 
    满足这个协议的类型将知道如何将一个 data 转换为实际的类型
 */

protocol Decodable {
    static func parse(data: Data) -> Self?
}
