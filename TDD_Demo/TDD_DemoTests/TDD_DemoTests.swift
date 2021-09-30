//
//  TDD_DemoTests.swift
//  TDD_DemoTests
//
//  Created by Kazunori Aoki on 2021/09/30.
//

import XCTest
@testable import TDD_Demo

class TDD_DemoTests: XCTestCase {

    func test_card_notion() {
        var card: Card
        
        card = Card(rank: .three, suit: .heart)
        XCTAssertEqual(card.notation, "3♥")
        
        card = Card(rank: .jack, suit: .spade)
        XCTAssertEqual(card.notation, "J♠")
    }
    
    func test_has_same_suit() {
        var card1: Card
        var card2: Card
        
        card1 = Card(rank: .ace, suit: .heart)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertTrue(card1.hasSameSuit(card2))
        
        card1 = Card(rank: .ace, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertFalse(card1.hasSameSuit(card2))
    }
    
    func test_has_same_rank() {
        var card1: Card
        var card2: Card
        
        card1 = Card(rank: .two, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertTrue(card1.hasSameRank(card2))
        
        card1 = Card(rank: .ace, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertFalse(card1.hasSameRank(card2))
    }
    
    func test_card_equal() {
        XCTAssertEqual(
            Card(rank: .jack, suit: .club),
            Card(rank: .jack, suit: .club)
        )
        XCTAssertNotEqual(
            Card(rank: .queen, suit: .diamond),
            Card(rank: .jack, suit: .club)
        )
        XCTAssertNotEqual(
            Card(rank: .jack, suit: .diamond),
            Card(rank: .jack, suit: .club)
        )
        XCTAssertNotEqual(
            Card(rank: .queen, suit: .club),
            Card(rank: .jack, suit: .club)
        )
    }
    
    func test_is_pair() {
        var card1: Card
        var card2: Card
        var hand:  Hand
        
        card1 = Card(rank: .king, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand  = Hand(cards: [card1, card2])
        XCTAssertTrue(hand.isPair)
        
        card1 = Card(rank: .queen, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand  = Hand(cards: [card1, card2])
        XCTAssertFalse(hand.isPair)
    }
    
    func test_is_flash() {
        var card1: Card
        var card2: Card
        var hand:  Hand
        
        card1 = Card(rank: .king, suit: .spade)
        card2 = Card(rank: .king, suit: .spade)
        hand  = Hand(cards: [card1, card2])
        XCTAssertTrue(hand.isFlush)
        
        card1 = Card(rank: .queen, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand  = Hand(cards: [card1, card2])
        XCTAssertFalse(hand.isFlush)
    }
    
    func test_high_card() {
        var card1: Card
        var card2: Card
        var hand:  Hand
        
        card1 = Card(rank: .king, suit: .spade)
        card2 = Card(rank: .queen, suit: .spade)
        hand  = Hand(cards: [card1, card2])
        XCTAssertTrue(hand.isFlush)
        
        card1 = Card(rank: .queen, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand  = Hand(cards: [card1, card2])
        XCTAssertFalse(hand.isFlush)
    }
}
