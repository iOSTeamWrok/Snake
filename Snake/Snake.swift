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
enum Status {
    case normal, hit, eat
}

let shuttle:CGFloat = 10.0
let resetToZero:CGFloat = 5.0
let border:CGFloat = 300.0
var status: Status = .normal

class Snake: NSObject {
    
    private static var _snake: Snake?
    
    var bodyPoint: Array<CGPoint>? = [CGPoint(x:35, y:35), CGPoint(x:45, y:35), CGPoint(x:55, y:35)]
    var direction: Direction = .left
    var eatCount:Int = 0
    let fruit: Fruit = Fruit.shardInstance()
    
    static func shardInstance() -> Snake {
        if _snake == nil {
            _snake = Snake()
        }
        return _snake!
    }
    
    func snakeReset(){
        bodyPoint = [CGPoint(x:35, y:35), CGPoint(x:45, y:35), CGPoint(x:55, y:35)]
        direction = .left
        eatCount  = 0
    }

    func updateBody() -> Status{
        
        status = .normal
        
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
        }
        
    
        isHeaderEatFruit(headerPoint: header)
        isHeaderHitBody(headerPoint: header)
        
        if(eatCount != 0){
            eatCount -= 1
        }else{
            bodyPoint!.removeLast()
        }
        
        bodyPoint!.insert(header, at: 0)
        
        
        return status

    }
    
    func isHeaderEatFruit(headerPoint: CGPoint){
        if(headerPoint == fruit.location!){
            eat()
            fruit.getUsableLocation()
            status = .eat
        }
    }
    
    func eat(){
        eatCount += 2
    }
    
    func isHeaderHitBody(headerPoint: CGPoint){
        for num in 1...bodyPoint!.count - 1{
            let point = bodyPoint![num]
            if(point == headerPoint){
                status = .hit
                break
            }
        }
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

