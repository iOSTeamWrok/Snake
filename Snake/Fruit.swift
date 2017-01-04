//
//  Fruit.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class Fruit: NSObject {
    
    private static var _fruit: Fruit?
    
    var location: CGPoint? = CGPoint.zero
    
    static func shardInstance() -> Fruit {
        if _fruit == nil {
            _fruit = Fruit()
            _fruit?.getUsableLocation()
        }
        return _fruit!
    }
    
    
    private func createLocation() -> CGPoint{
        let xInt = UInt32(borderH) / 10
        let yInt = UInt32(borderV) / 10
        let x = Int(arc4random_uniform(xInt) * 10) + 5
        let y = Int(arc4random_uniform(yInt) * 10) + 5
        return CGPoint(x: x, y: y)
    }
    
    private func isFruitOnSnakeBody(createPoint: CGPoint) -> Bool {
        let snake = Snake.shardInstance()
        for point in snake.bodyPoint!{
            if(point == createPoint){
                return true
            }
        }
        return false
    }
    
    func getUsableLocation() {
        repeat {
            location = self.createLocation()
        } while self.isFruitOnSnakeBody(createPoint: location!)
    }
}
