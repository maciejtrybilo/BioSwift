//: Playground - noun: a place where people can play

import BioSwift

let adenine = Nucleotide("A")
let thymine = Nucleotide.T
let guanine = Nucleotide.G
let cytosine = Nucleotide.C

let dna = NucleicAcid("GATCCTG")!
dna.complement()


