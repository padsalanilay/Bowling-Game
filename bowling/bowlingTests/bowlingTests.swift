//
//  bowlingTests.swift
//  bowlingTests
//
//

import XCTest
@testable import bowling

class bowlingTests: XCTestCase {
    
    var game: Game?
    override func setUpWithError() throws {
        self.game = Game()
    }
    
    override func tearDownWithError() throws {
        self.game = nil
    }
    
    func take(shots: [Shot]) throws {
        for shot in shots {
            try game?.take(shot: shot)
        }
    }
    
    func score() -> Int {
        game?.players[0].frames[9].score ?? -1
    }
    
    func spare(of value: Int) -> Shot{
        .spare(pinsKnockedDown: PinsKnockedDown(rawValue: value)!)
    }
    
    func testAllZeros() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        
        try? self.take(shots: shots)
        
        XCTAssertEqual(score(), 0)
    }
    
    func testNoStrikesOrSpares() {
        let shots: [Shot] = [.three, .six, .three, .six, .three, .six, .three, .six, .three, .six, .three, .six, .three, .six, .three, .six, .three, .six, .three, .six]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 90)
    }
    func testSpareFollowedByZeros() {
        let shots: [Shot] = [.six, spare(of: 4), .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 10)
    }
    
    func testPointsScoredInRollAfterSpare() {
        let shots: [Shot] = [.six, spare(of: 4), .three, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 16)
    }
    
    func testConsecutiveSpares() {
        let shots: [Shot] = [.five, spare(of: 5), .three, spare(of: 7), .four, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 31)
    }
    
    func testSpareInLastFrame() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .seven, spare(of: 3), .seven]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 17)
    }
    
    func testStrikeWithSingleRoll() {
        let shots: [Shot] = [.strike, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 10)
    }
    
    func testTwoRollsAfterAStrike() {
        let shots: [Shot] = [.strike, .five, .three, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 26)
    }
    
    func testConsecutiveStrikes() {
        let shots: [Shot] = [.strike, .strike, .strike, .five, .three, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 81)
    }
    
    func testStrikeInLastFrame() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .strike, .seven, .one]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 18)
    }
    
    func testSpareWithTwoRollBonus() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .strike, .seven, spare(of: 3)]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 20)
    }
    
    func testStrikesWithTwoRollBonus() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .strike, .strike, .strike]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 30)
    }
    
    func testStrikeAfterSpareInLastFrame() {
        let shots: [Shot] = [.gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .gutter, .seven, spare(of: 3), .strike]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 20)
    }
    
    func testAllStrikes() {
        let shots: [Shot] = [.strike, .strike, .strike, .strike, .strike, .strike, .strike, .strike, .strike, .strike, .strike, .strike]
        try? take(shots: shots)
        
        XCTAssertEqual(score(), 300)
    }
    
}
