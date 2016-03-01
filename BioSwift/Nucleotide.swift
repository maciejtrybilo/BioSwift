//
//  Nucleotide.swift
//  BioSwift
//
//  Created by Maciej Trybilo on 29/02/2016.
//  Copyright © 2016 Maciej Trybilo. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public enum Nucleotide {
    
    case A, C, G, T, U, R, Y, K, M, S, W, B, D, H, V, N, GAP
    
    public init?(_ character: Character) {
        
        switch character {
        case "A", "a": self = .A
        case "C", "c": self = .C
        case "G", "g": self = .G
        case "T", "t": self = .T
        case "U", "u": self = .U
        case "R", "r": self = .R
        case "Y", "y": self = .Y
        case "K", "k": self = .K
        case "M", "m": self = .M
        case "S", "s": self = .S
        case "W", "w": self = .W
        case "B", "b": self = .B
        case "D", "d": self = .D
        case "H", "h": self = .H
        case "V", "v": self = .V
        case "N", "n": self = .N
        case "-": self = .GAP
        default: return nil
        }
    }
    
    public init?(_ string: String) {
        
        if string.characters.count == 1 {
            self.init(string.characters.first!)
        } else {
            return nil
        }
    }
    
    public func complementary(other: Nucleotide) -> Bool {
        
        switch (self, other) {
        case (.A, .T), (.T, .A): return true
        case (.C, .G), (.G, .C): return true
        case (.A, .U), (.U, .A): return true
        case (.R, .Y), (.Y, .R): return true
        case (.K, .M), (.M, .K): return true
        case (.S, .S): return true
        case (.W, .W): return true
        case (.B, .V), (.V, .B): return true
        case (.D, .H), (.H, .D): return true
        case (.N, .N): return true
        case (.GAP, .GAP): return true
        default: return false
        }
    }
    
    public func complement() -> Nucleotide {
        
        switch self {
        case .A: return .T // .U?
        case .C: return .G
        case .G: return .C
        case .T: return .A
        case .U: return .A
        case .R: return .Y
        case .Y: return .R
        case .K: return .M
        case .M: return .K
        case .S: return .S
        case .W: return .W
        case .B: return .V
        case .D: return .H
        case .H: return .D
        case .V: return .B
        case .N: return .N
        case .GAP: return .GAP
        }
    }
    
    public func toCharacter() -> Character {
        
        switch self {
        case .A: return "A"
        case .C: return "C"
        case .G: return "G"
        case .T: return "T"
        case .U: return "U"
        case .R: return "R"
        case .Y: return "Y"
        case .K: return "K"
        case .M: return "M"
        case .S: return "S"
        case .W: return "W"
        case .B: return "B"
        case .D: return "D"
        case .H: return "H"
        case .V: return "V"
        case .N: return "N"
        case .GAP: return "-"
        }
    }
    
}
