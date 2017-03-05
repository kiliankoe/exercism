struct Nucleotide {
    let strand: String

    private func dnaToRna(nuc: String) -> String {
        let mapping = [
            "A": "U",
            "C": "G",
            "G": "C",
            "T": "A"
        ]

        return mapping[nuc]!
    }

    init(_ strand: String) {
        self.strand = strand
    }

    var complementOfDNA: String {
        return strand.characters
            .map{String($0)}
            .map(dnaToRna)
            .joined()
    }
}
