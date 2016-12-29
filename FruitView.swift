//
//  FruitView.swift
//  Snake
//
//  Created by lung on 2016/12/29.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class FruitView: UIView {

    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(UIColor.purple.cgColor)
        
        context?.setLineWidth(shuttle)
        
        let fruit = Fruit.shardInstance()

        let imagePath = Bundle.main.path(forResource: "apple", ofType: "png")
        let image = UIImage(contentsOfFile: imagePath!)
        

        image?.draw(in: CGRect(x: fruit.location!.x - resetToZero , y: fruit.location!.y - resetToZero, width: shuttle, height: shuttle))

        
        context?.strokePath()
    }
}
