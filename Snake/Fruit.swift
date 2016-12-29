//
//  Fruit.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class Fruit: NSObject {
    var location: CGPoint?
    
    func createLocation(){
        let x = Int(arc4random())%Int(border/10) * 10 + 5
        let y = Int(arc4random())%Int(border/10) * 10 + 5
        location! = CGPoint(x: x, y: y)
    }
}
