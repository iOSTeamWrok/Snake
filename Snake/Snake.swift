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

let shuttle:CGFloat = 10.0
let resetToZero:CGFloat = 5.0
let borderH:CGFloat = UIScreen.main.bounds.size.width - CGFloat(fmodf(Float(UIScreen.main.bounds.size.width), 10))
let borderV:CGFloat = UIScreen.main.bounds.size.height - 64 - CGFloat(fmodf(Float(UIScreen.main.bounds.size.height - 64), 10))
let constraintH:CGFloat = CGFloat(fmodf(Float(UIScreen.main.bounds.size.width), 10))
let constraintV:CGFloat = CGFloat(fmodf(Float(UIScreen.main.bounds.size.height - 64), 10))


class Snake: NSObject {
    
    private static var _snake: Snake?

    var bodyPoint: Array<CGPoint>? = [CGPoint(x:35, y:35), CGPoint(x:45, y:35), CGPoint(x:55, y:35)]
    var direction: Direction = .left
    var eatCount:Int = 0
    let fruit: Fruit = Fruit.shardInstance()
    let score: Score = Score.sharedInstance()
    var header: CGPoint?
    
    static func shardInstance() -> Snake {
        if _snake == nil {
            _snake = Snake()
        }
        return _snake!
    }
    
    func snakeReset(){
        bodyPoint = [CGPoint(x:35, y:35), CGPoint(x:45, y:35), CGPoint(x:55, y:35),]
        direction = .left
        eatCount  = 0
        score.resetScore()
    }

    func move(){
        
        header = bodyPoint![0]
        
        switch direction {
        case .left:
            if(header!.x - shuttle < 0){
                header!.x = borderH - resetToZero
            }else{
                header!.x -= shuttle
            }
            break
        case .right:
            if(header!.x + shuttle > borderH){
                header!.x = resetToZero
            }else{
                header!.x += shuttle
            }
            break
        case .top:
            if(header!.y - shuttle < 0){
                header!.y = borderV - resetToZero
            }else{
                header!.y -= shuttle
            }
            
            break
        case .bottom:
            if(header!.y + shuttle > borderV){
                header!.y = resetToZero
            }else{
                header!.y += shuttle
            }
            break
        }

        if(eatCount != 0){
            eatCount -= 1
        }else{
            bodyPoint!.removeLast()
        }
        
        bodyPoint!.insert(header!, at: 0)

    }
    
    func isHeaderEatFruit() -> Bool{
        if(header! == fruit.location!){
            eat()
            fruit.getUsableLocation()
            return true
        }
        return false
    }
    
    func eat(){
        score.actEatFruit()
        eatCount += 2
    }
    
    func isHeaderHitBody() -> Bool{
        for num in 1...bodyPoint!.count - 1{
            let point = bodyPoint![num]
            if(point == header!){
                return true
            }
        }
        return false
    }
    
    func getSwipe(_ swipe: UISwipeGestureRecognizer){
        
        if((direction == .top || direction == .bottom) && (swipe.direction == UISwipeGestureRecognizerDirection.up || swipe.direction == UISwipeGestureRecognizerDirection.down)){
            return
        }
        
        if((direction == .left || direction == .right) && (swipe.direction == UISwipeGestureRecognizerDirection.left || swipe.direction == UISwipeGestureRecognizerDirection.right)){
            return
        }
        
        
        switch swipe.direction {
        case UISwipeGestureRecognizerDirection.up:
            direction = .top
            break
        case UISwipeGestureRecognizerDirection.down:
            direction = .bottom
            break
        case UISwipeGestureRecognizerDirection.right:
            direction = .right
            break
        case UISwipeGestureRecognizerDirection.left:
            direction = .left
            break
            
        default:
            break
        }
    }
}

