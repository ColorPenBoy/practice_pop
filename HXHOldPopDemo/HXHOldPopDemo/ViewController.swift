//
//  ViewController.swift
//  HXHOldPopDemo
//
//  Created by 张强 on 2016/12/7.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let request = UserRequest(name: "onevcat")
        request.send { user in
            if let user = user {
                print("\(user.message) from \(user.name)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

