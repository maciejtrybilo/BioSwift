//
//  NucleotideTests.swift
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

import XCTest

class NucleotideTests: XCTestCase {
    
    let adenine = Nucleotide("A")!
    let cytosine = Nucleotide("C")!
    let guanine = Nucleotide("G")!
    let thymine = Nucleotide("T")!

    func testCreation() {
        
        XCTAssertNotNil(Nucleotide("A"))
        XCTAssertNotNil(Nucleotide("a"))
        
        XCTAssertNotNil(Nucleotide("C"))
        XCTAssertNotNil(Nucleotide("c"))
        
        XCTAssertNotNil(Nucleotide("G"))
        XCTAssertNotNil(Nucleotide("g"))
        
        XCTAssertNotNil(Nucleotide("T"))
        XCTAssertNotNil(Nucleotide("t"))
        
        XCTAssertNil(Nucleotide(""))
    }
    
    func testComplementarity() {
        
        XCTAssertTrue(adenine.complementary(thymine))
        XCTAssertFalse(adenine.complementary(cytosine))
        XCTAssertFalse(adenine.complementary(adenine))
        
        XCTAssertTrue(guanine.complementary(cytosine))
    }

    func testComplement() {
        
        XCTAssertEqual(adenine.complement(), thymine)
        XCTAssertEqual(thymine.complement(), adenine)
        XCTAssertEqual(cytosine.complement(), guanine)
        XCTAssertEqual(guanine.complement(), cytosine)
    }
    
    func test_toCharacter() {
        
        XCTAssertEqual(adenine.toCharacter(), "A")
        XCTAssertEqual(cytosine.toCharacter(), "C")
        XCTAssertEqual(guanine.toCharacter(), "G")
        XCTAssertEqual(thymine.toCharacter(), "T")
    }
    
}
