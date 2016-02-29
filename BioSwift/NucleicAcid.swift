//
//  NucleicAcid.swift
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

public struct NucleicAcid: Equatable, CustomStringConvertible {
    
    var nucleotides = [Nucleotide]()
    
    public init(nucleotides: [Nucleotide]) {
        self.nucleotides = nucleotides
    }
    
    public init?(_ string: String) {
        
        if string.isEmpty {
            return nil
        }
        
        for character in string.characters {
            
            if let nucleotide = Nucleotide(character) {
                nucleotides += [nucleotide]
            } else {
                return nil
            }
        }
    }
    
    public func complement() -> NucleicAcid {
        
        var nucleotides = [Nucleotide]()
        
        for nucleotide in self.nucleotides {
            nucleotides += [nucleotide.complement()]
        }
        
        return NucleicAcid(nucleotides: nucleotides)
    }
    
    public func reverse() -> NucleicAcid {
        
        return NucleicAcid(nucleotides: nucleotides.reverse())
    }
    
    public func toString() -> String {
        
        var string = ""
        
        for nucleotide in nucleotides {
            string.append(nucleotide.toCharacter())
        }
        
        return string
    }
}

// MARK: - CustomStringConvertible

extension NucleicAcid {
    
    public var description: String {
        return toString()
    }
}

// MARK: - Equatable

public func ==(lhs: NucleicAcid, rhs: NucleicAcid) -> Bool {
    
    if lhs.nucleotides.count != rhs.nucleotides.count { return false }
    
    for (idx, element) in lhs.nucleotides.enumerate() {
        
        if element != rhs.nucleotides[idx] { return false }
    }
    
    return true
}
