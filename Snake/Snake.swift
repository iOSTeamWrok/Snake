//
//  Snake.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

enum Direction {
    case top, bottom, left, right
}

class Snake: NSObject {
    var bodyPoint: Array<CGPoint>?
    var direction: Direction
    
    override init(){
        direction = .bottom
    }
}
