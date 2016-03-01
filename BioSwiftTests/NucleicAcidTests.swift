//
//  NucleicAcidTests.swift
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

class NucleicAcidTests: XCTestCase {

    func test_init() {
        
        XCTAssertNotNil(NucleicAcid("GATACAT"))
        XCTAssertNil(NucleicAcid("GATA😺CAT"))
        XCTAssertNil(NucleicAcid(""))
        
        XCTAssertEqual(NucleicAcid("ACTGGCTCAT")!, NucleicAcid(nucleotides: [.A, .C, .T, .G, .G, .C, .T, .C, .A, .T]))
        
        let sequence = NucleicAcid(">Meow gene 😸\nACTGTATG")
        
        XCTAssertEqual(sequence!.defline!, "Meow gene 😸")
        XCTAssertEqual(sequence!.toString(), "ACTGTATG")
        
        let sequenceWithEmptyName = NucleicAcid("> \nACTGTATG")
        
        XCTAssertNil(sequenceWithEmptyName!.defline)
        XCTAssertEqual(sequenceWithEmptyName!.toString(), "ACTGTATG")
    }
    
    func test_fullFASTA() {
        
        let string = "ACGTURYKMSWBDHVN-"
        
        let sequence = NucleicAcid(string)
        
        XCTAssertNotNil(sequence)
        
        XCTAssertEqual(sequence!.toString(), string)
    }
    
    func test_equals() {
        
        XCTAssertEqual(NucleicAcid(nucleotides: [.A]), NucleicAcid(nucleotides: [.A]))
        XCTAssertNotEqual(NucleicAcid(nucleotides: [.A]), NucleicAcid(nucleotides: [.T]))
    }
    
    func test_complement() {
        
        XCTAssertEqual(
            NucleicAcid("ACTGGCCTAT")!.complement(),
            NucleicAcid("TGACCGGATA")!)
    }
    
    func test_reverse() {
        
        XCTAssertEqual(
            NucleicAcid("ACTGGCCTAT")!.reverse(),
            NucleicAcid("TATCCGGTCA")!)
        
    }
    
    func test_toString() {
        
        XCTAssertEqual(NucleicAcid("ACTGGCCTAT")!.toString(), "ACTGGCCTAT")
    }
}
