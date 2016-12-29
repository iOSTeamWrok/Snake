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

        context?.setFillColor(UIColor.purple.cgColor)
        
        context?.setLineWidth(shuttle)

        let snake = Snake.shardInstance()
        
        var first = true
        
        for point in snake.bodyPoint!{
            
            if(first){
                let imagePath = Bundle.main.path(forResource: "snake", ofType: "png")
                let image = UIImage(contentsOfFile: imagePath!)
                
                var imgOrientation: UIImageOrientation?
                var displacementX: CGFloat = 0
                var displacementY: CGFloat = 0

                switch snake.direction {
                case .top:
                    imgOrientation = UIImageOrientation.down
                    displacementX = -2
                    displacementY = 0
                    break
                case .bottom:
                    imgOrientation = UIImageOrientation.up
                    displacementX = -2
                    displacementY = -4
                    break
                case .right:
                    imgOrientation = UIImageOrientation.left
                    displacementX = -4
                    displacementY = -2
                    break
                case .left:
                    imgOrientation = UIImageOrientation.right
                    displacementX = 0
                    displacementY = -2
                    break
                }
                
                let resultImage = UIImage(cgImage: image!.cgImage!, scale: 1, orientation: imgOrientation!)

                resultImage.draw(in: CGRect(x: point.x - resetToZero + displacementX , y: point.y - resetToZero + displacementY, width: shuttle + 4, height: shuttle + 4))
                first = false
            }else{
                context?.fill(CGRect(x: point.x - resetToZero, y: point.y - resetToZero, width: shuttle, height: shuttle))
            }
        }
        
        context?.strokePath()
    }

}
