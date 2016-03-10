//
//  FASTAReaderTests.swift
//  BioSwift
//
//  Created by Maciej Trybilo on 01/03/2016.
//  Copyright © 2016 Maciej Trybilo. All rights reserved.
//

import XCTest

class FASTAReaderTests: XCTestCase {

    func test_readFromFile() {
                
        let sequences = FASTAReader.readFromFile(NSBundle(forClass: self.dynamicType).pathForResource("example", ofType: "fa")!)
        
        XCTAssertEqual(sequences.count, 3)
        
        XCTAssertEqual(sequences[0].identifier!, "GENSCAN00000000001")
        XCTAssertEqual(sequences[0].desc!, "cdna:genscan scaffold:ailMel1:GL207044.1:255:438:-1 transcript_biotype:protein_coding")
        XCTAssertEqual(sequences[0].toString(), "ACCTTTTCCATCGACTTGTTCACCAGGTCAAAAGCATTCAGGATGCAATCCGGGACAAGAAGCAGCGGTTCAACTTCCTTGGGGAGGAGATTAGCCTGGATCCTTCTGTGGGAATCTTCATCACCATGAACCCGGGCTATGCCGGCCGCACGGAACTTCCCGAGAACCTCAAGGCTCTCTTCAG")
        
        XCTAssertEqual(sequences[1].identifier!, "GENSCAN00000000002")
        XCTAssertEqual(sequences[1].desc!, "cdna:genscan scaffold:ailMel1:GL200337.1:90:229:-1 transcript_biotype:protein_coding")
        XCTAssertEqual(sequences[1].toString(), "CTCCCCCCACGGTTCGTATTGTGCATTCGGGCTTGGCCTGTAACATTGAGGAGGAGCGCTACTCTGAAAGGGTCTATACCATACGGGAAGGAGAAACCCTAGAACTGACCTGTCTGGTCACAGGACATCCACGTCCACAG")
        
        XCTAssertEqual(sequences[2].identifier!, "GENSCAN00000000003")
        XCTAssertEqual(sequences[2].desc!, "cdna:genscan scaffold:ailMel1:GL210054.1:384:503:1 transcript_biotype:protein_coding")
        XCTAssertEqual(sequences[2].toString(), "TCCGGTCTACACACAGCAAGCTGCTTACAGGGAATGCCTGCAGTTCTCTGCCTGGGGGCATCTTGTTGGCAGGGGAGTACTCAGGACCTCAAAGAGATGCCAAACAGAAGTACCAGAGAG")
    }

}
