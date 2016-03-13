//
//  FASTAReader.swift
//  BioSwift
//
//  Created by Maciej Trybilo on 01/03/2016.
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

import Foundation

public struct FASTAReader {
    
    public static func readFromFile(path: String) -> [NucleicAcid] {
        
        var sequences = [NucleicAcid]()
        
        var currentSequence = ""
        
        do {
            let lines = try String(contentsOfFile: path).componentsSeparatedByCharactersInSet(.newlineCharacterSet())
            
            for line in lines {
                
                if line.hasPrefix(";") || line.hasPrefix(">") {
                    
                    if let nucleicAcid = NucleicAcid(currentSequence) {
                        
                        sequences += [nucleicAcid]
                    }
                    
                    currentSequence = ""
                }
                
                if !line.hasPrefix(";") && !line.isEmpty {
                    
                    currentSequence += (line + "\n")
                }
            }
            
            if let nucleicAcid = NucleicAcid(currentSequence) {
                
                sequences += [nucleicAcid]
            }
            
        } catch _ {
            return []
        }
        
        return sequences
    }
    
    public static func writeToFile(sequences: [NucleicAcid], atPath path: String, var numberOfCharactersInLine: Int = 80) {
        
        if numberOfCharactersInLine < 1 {
            numberOfCharactersInLine = 80
        }
        
        if let outputStream = NSOutputStream(toFileAtPath: path, append: false) {
            outputStream.open()
            writeSequences(sequences, toStream: outputStream, numberOfCharactersInLine: numberOfCharactersInLine)
            
        } else {
            print("Could not open file \(path) for writing.")
        }
    }
    
    static func writeSequences(sequences: [NucleicAcid], toStream stream: NSOutputStream, numberOfCharactersInLine: Int) {
    
        for sequence in sequences {
            
            let defline = ">" + (sequence.identifier ?? "") + " " + (sequence.desc ?? "") + "\n"
            
            let data = defline.dataUsingEncoding(NSUTF8StringEncoding)!
            stream.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
            
            print(defline)
            print(sequence.toString())
            
            var start = 0
            var end = numberOfCharactersInLine
            
            while let line = sequence[start..<end]?.toString() {
                
                let data = (line + "\n").dataUsingEncoding(NSUTF8StringEncoding)!
                stream.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
                print(line)
                
                start += numberOfCharactersInLine
                end += numberOfCharactersInLine
            }
        }
        
        stream.close()
    }
}


