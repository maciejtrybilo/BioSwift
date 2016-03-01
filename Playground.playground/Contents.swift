//: Playground - noun: a place where people can play

import BioSwift

let adenine = Nucleotide("A")
let thymine = Nucleotide.T
let guanine = Nucleotide.G
let cytosine = Nucleotide.C

let dna = NucleicAcid("GATCCTG")!
let complement = dna.complement()
let reverse = complement.reverse()

let fullFASTA = "ACGTURYKMSWBDHVN-"

let fullFASTASequence = NucleicAcid(fullFASTA)
fullFASTASequence?.complement()
