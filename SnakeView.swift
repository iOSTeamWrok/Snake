//
//  SnakeView.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class SnakeView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(UIColor.red.cgColor)
        
        context?.setLineWidth(shuttle)

        let snake = Snake.shardInstance()
        
        for point in snake.bodyPoint!{
            context?.fill(CGRect(x: point.x - resetToZero, y: point.y - resetToZero, width: shuttle, height: shuttle))
        }
        
        context?.strokePath()
    }

}
