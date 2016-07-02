struct DNA {
    private let strand: [DNANucleotide]

    init?(strand: String) {
        var nucleotides = [DNANucleotide]()
        for nucleotideString in (strand.characters.map{String($0)}) {
            guard let nucleotide = DNANucleotide(rawValue: nucleotideString) else { return nil }
            nucleotides.append(nucleotide)
        }
        self.strand = nucleotides
    }

    func count(_ nucleotide: String) -> Int {
        // force-unwrapping the following is uncool, but the
        // tests don't take my awesome enum into regard :D
        let nucleotide = DNANucleotide(rawValue: nucleotide)!
        return count(nucleotide)
    }

    // This is how it should look, because then you can
    // do nifty things like this: dna.count(.adenine)
    func count(_ nucleotide: DNANucleotide) -> Int {
        return strand.filter{ $0 == nucleotide }.count
    }

    func counts() -> [String: Int] {
        var counts = ["A": 0, "C": 0, "G": 0, "T": 0]
        strand.forEach {
            counts[$0.rawValue] = (counts[$0.rawValue] ?? 0) + 1
        }
        return counts
    }
}

enum DNANucleotide: String {
    case adenine = "A", cytosine = "C", guanine = "G", thymine = "T"
}
