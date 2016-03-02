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
        
        let sequences = FASTAReader.readFromFile(NSBundle.mainBundle().resourcePath! + "/example.fa")
        
        //XCTAssertEqual(sequences.count, 3)
    }

}
