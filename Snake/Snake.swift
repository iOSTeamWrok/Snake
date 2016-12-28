//
//  Snake.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

let shuttle:CGFloat = 10.0
let resetToZero:CGFloat = 5.0
let border:CGFloat = 300.0

enum Direction {
    case top, bottom, left, right
}

class Snake: NSObject {
    
    private static var _snake: Snake?
    
    var bodyPoint: Array<CGPoint>? = [CGPoint(x:35, y:35), CGPoint(x:45, y:35), CGPoint(x:55, y:35)]
    var direction: Direction = .left
    var eatCount:Int = 0
    
    static func shardInstance() -> Snake {
        if _snake == nil {
            _snake = Snake()
        }
        return _snake!
    }

    func updateBody(){
        
        var header = bodyPoint![0]
        
        switch direction {
        case .left:
            if(header.x - shuttle < 0){
                header.x = border - resetToZero
            }else{
                header.x -= shuttle
            }
            
            break
        case .right:
            if(header.x + shuttle > border){
                header.x = resetToZero
            }else{
                header.x += shuttle
            }
            
            break
        case .top:
            if(header.y - shuttle < 0){
                header.y = border - resetToZero
            }else{
                header.y -= shuttle
            }
            
            break
        case .bottom:
            if(header.y + shuttle > border){
                header.y = resetToZero
            }else{
                header.y += shuttle
            }
            break
            
        default:
            break
        }
        if(eatCount != 0){
            eatCount -= 1
        }else{
            bodyPoint!.removeLast()
        }
        
        bodyPoint!.insert(header, at: 0)
        
    }
    
    func eat(){
        eatCount += 2
    }
    
    func getSwipe(direction: Direction){
        self.direction = direction
    }
}

