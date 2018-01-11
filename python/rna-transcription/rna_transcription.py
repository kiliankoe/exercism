def to_rna(dna_strand):
    return ''.join(map(_single_to_rna, dna_strand))

def _single_to_rna(dna):
    nucleotides = {
        'C': 'G',
        'G': 'C',
        'T': 'A',
        'A': 'U',
    }
    if dna in nucleotides:
        return nucleotides.get(dna)
    else:
        raise ValueError('invalid nucleotide')
