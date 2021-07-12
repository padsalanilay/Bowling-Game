//
//  PinsKnokedDown.swift
//  bowling
//
//

import Foundation

enum PinsKnockedDown: Int {
    // Player knocks down 1-9 pin in one shot
    case one = 1, two, three, four, five, six, seven, eight, nine
    
    // Player knocks down all the pins in shot (only possible in second shot if the first shot was gutter.).
    case ten
}

