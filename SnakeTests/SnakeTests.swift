//
//  SnakeTests.swift
//  SnakeTests
//
//  Created by lung on 2016/12/28.
//  Copyright © 2016年 lung. All rights reserved.
//

import XCTest
@testable import Snake

class SnakeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIsHeaderHitBody() {
        let snake = Snake.shardInstance()
        snake.eat()
        snake.direction = .top
        snake.move()
        snake.direction = .right
        snake.move()
        snake.direction = .bottom
        snake.move()
        XCTAssertEqual(snake.isHeaderHitBody(), true, "hit body")
    }
    
    func testIsHeaderEatFruit() {
        let snake = Snake.shardInstance()
        let length = snake.bodyPoint!.count
        snake.eat()
        snake.move()
        snake.move()
        XCTAssertEqual(snake.bodyPoint!.count, length + 2, "Snake Length is \(length + 2)")
        
    }
    
}
