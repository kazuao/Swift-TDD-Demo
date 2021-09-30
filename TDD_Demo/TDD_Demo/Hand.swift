//
//  Hand.swift
//  TDD_Demo
//
//  Created by Kazunori Aoki on 2021/09/30.
//

import Foundation

enum IsWinnerStatus {
    case LhsWin
    case RhsWin
    case Drow
}

struct Hand {
    let cards: [Card]
    
    var isPair: Bool {
        return cards[0].rank == cards[1].rank
    }
    
    var isFlush: Bool {
        return cards[0].suit == cards[1].suit
    }
    
    func isHight(lhs: Card, rhs: Card) -> IsWinnerStatus {
        var status = IsWinnerStatus.Drow
        
        if lhs.rank >= rhs.rank {
            
        }
    }
}
