//
//  Score.swift
//  Snake
//
//  Created by TMS_MacbookPro12G on 2017/1/3.
//  Copyright © 2017年 lung. All rights reserved.
//

import UIKit

enum GameLevel: Int {
    case One = 1, Two = 2
}

let kBasicBounds: Int = 10
let kLevelTwo: Int = 200

class Score: NSObject {
    private static var _score: Score?
    
    var level: GameLevel = .One
    var iUserScore: Int = 0
    
    static func sharedInstance() -> Score {
        if _score == nil {
            _score = Score()
        }
        return _score!
    }
    
    func getCurrentLevel() -> GameLevel {
        return level
    }
    
    func resetScore() {
        level = .One
        iUserScore = 0
    }
    
    func actEatFruit() {
        iUserScore += kBasicBounds * level.rawValue
        if(iUserScore >= kLevelTwo){
            //目前暫不使用進到下個等級的狀態
//            level = .Two
        }
    }
}
