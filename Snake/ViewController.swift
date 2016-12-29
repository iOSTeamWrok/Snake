//
//  ViewController.swift
//  Snake
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    var timer: Timer?
    var snake: Snake?
    var snakeView: SnakeView?
    var fruit: Fruit?
    var fruitView: FruitView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        snake = Snake.shardInstance()
        fruit = Fruit.shardInstance()
        addSwipe()
        gameView.layer.borderWidth = 1
        gameView.layer.borderColor = UIColor.black.cgColor
        gameView.isUserInteractionEnabled = false
        
        fruitView = FruitView(frame: CGRect(origin: CGPoint.zero, size: gameView.frame.size))
        fruitView?.backgroundColor = UIColor.clear
        gameView.addSubview(fruitView!)
        
        snakeView = SnakeView(frame: CGRect(origin: CGPoint.zero, size: gameView.frame.size))
        snakeView?.backgroundColor = UIColor.clear
        gameView.addSubview(snakeView!)
        
        self.addSwipe()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateView(){
        let snakeStatus = snake!.updateBody()
        if(snakeStatus == .eat){
            fruitView?.setNeedsDisplay()
        }else if(snakeStatus == .hit){
            timer?.invalidate()
            timer = nil
            gameOver()
        }
        
        snakeView?.setNeedsDisplay()
    }

    func addSwipe(){
        let swipeDirection: Array<UISwipeGestureRecognizerDirection> = [
            UISwipeGestureRecognizerDirection.up,
            UISwipeGestureRecognizerDirection.down,
            UISwipeGestureRecognizerDirection.left,
            UISwipeGestureRecognizerDirection.right
        ]
        
        for direction in swipeDirection{
            let gesture = UISwipeGestureRecognizer(target: snake, action: #selector(snake?.getSwipe(_:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
    }
    
    func gameOver(){
        let alertController = UIAlertController(title: "GameOver", message: "遊戲結束", preferredStyle: .alert)
        let againAction = UIAlertAction(title: "重新開始", style: .default) { (UIAlertAction) in
            self.snake?.snakeReset()
            self.fruit?.getUsableLocation()
            self.fruitView?.setNeedsDisplay()
            self.timer = Timer.scheduledTimer(timeInterval: 0.1
                , target: self, selector: #selector(self.updateView), userInfo: nil, repeats: true)
        }
        alertController.addAction(againAction)
        self.present(alertController, animated: true, completion: nil)
    }
   
    @IBAction func startHandler(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1
            , target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
        sender.isHidden = true
    }

}

