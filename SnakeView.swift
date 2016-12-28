//
//  SnakeView.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class SnakeView: UIView {
    
    var snake: Snake?
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()

        context?.setStrokeColor(UIColor.red.cgColor)
        
        context?.setLineWidth(5)

        if(snake == nil){
            return
        }
        var header = snake!.bodyPoint![0]
        
        switch snake!.direction {
            case .top:
                
            break
            
            case .bottom:
                if(header.y + 10 > 300) {
                    header.y = 0
                }else{
                    header.y += 10
                }
            break
            
            case .left:
            
            break
            
            case .right:
            
            break
        
            default:
            break
        }
        
        snake?.bodyPoint?.removeLast()
        
        snake?.bodyPoint?.insert(header, at: 0)

        let snakeLength = snake!.bodyPoint!.count
        
        var test = false
        for num in snake!.bodyPoint!{
            
            
            if(test == false){
                context?.move(to: num)
                test = true
            }else{
                context?.addLine(to: num)
            }
            
            
            
        }
        
        context?.strokePath()
    }

    func displaySnake(snake: Snake){
        self.snake = snake
        self.setNeedsDisplay()
    }
}
