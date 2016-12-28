//
//  ViewController.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

let AAA = 2

class ViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    var timer: Timer?
    var snake: Snake?
    var snakeView: SnakeView?
    override func viewDidLoad() {
        super.viewDidLoad()
        initSnake()
        gameView.layer.borderWidth = 1
        gameView.layer.borderColor = UIColor.black.cgColor
        
        snakeView = SnakeView(frame: CGRect(origin: CGPoint.zero, size: gameView.frame.size))
        snakeView?.backgroundColor = UIColor.white
        gameView.addSubview(snakeView!)
        
        

        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSnake(){
        snake = Snake()
        snake?.bodyPoint = [CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 160), CGPoint(x: 150, y: 170)]
    }

    func updateView(){
        snakeView?.displaySnake(snake: snake!)
    }

}

