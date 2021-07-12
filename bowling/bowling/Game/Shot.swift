//
//  Shot.swift
//  bowling
//
//

import Foundation

enum Shot: Equatable{
    
    // player misses all the pins
    case gutter
    
    // player knocks down 1-9 pins in one shot
    case one, two, three, four, five, six, seven, eight, nine
    
    // player knocks down remaining pins in second shot of the frame (1-10)
    case spare(pinsKnockedDown: PinsKnockedDown)
    
    // player knocks down all(10) pins in firs shot of any frame
    case strike
}

extension Shot {
    var numericValue: Int {
        switch self {
        case .gutter: return 0
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .spare(let pinsKnockedDown): return pinsKnockedDown.rawValue
        case .strike: return 10
        }
    }

    static let allShots: [Shot] = [
        .gutter, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine,
        .strike
    ]
    
    static let allSpares: [Shot] = [
        .spare(pinsKnockedDown: .one), .spare(pinsKnockedDown: .two),
        .spare(pinsKnockedDown: .three), .spare(pinsKnockedDown: .four),
        .spare(pinsKnockedDown: .five), .spare(pinsKnockedDown: .six),
        .spare(pinsKnockedDown: .seven), .spare(pinsKnockedDown: .eight),
        .spare(pinsKnockedDown: .nine), .spare(pinsKnockedDown: .ten)
    ]
    var stringValue: String {
        switch self {
        case .gutter: return "-"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .spare: return "/"
        case .strike: return "X"
        }
    }
}
