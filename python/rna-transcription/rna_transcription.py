nucleotides = {
    'C': 'G',
    'G': 'C',
    'T': 'A',
    'A': 'U',
}

def to_rna(dna_strand):
    try:
        return ''.join([nucleotides[char] for char in dna_strand])
    except KeyError:
        raise ValueError('invalid nucleotide')
