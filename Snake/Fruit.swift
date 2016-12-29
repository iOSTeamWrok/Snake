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
        let xInt = UInt32(border) / 10
//        let x = Int(arc4random())%xInt * 10 + 5
//        let y = Int(arc4random())%xInt * 10 + 5
        let x = Int(arc4random_uniform(xInt) * 10) + 5
        let y = Int(arc4random_uniform(xInt) * 10) + 5
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
        var fruitPoint = self.createLocation()
        while self.isFruitOnSnakeBody(createPoint: fruitPoint) {
            fruitPoint = self.createLocation()
        }
        location = fruitPoint
    }
}
