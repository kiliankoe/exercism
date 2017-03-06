public class RnaTranscription {
    public static String ofDna(String strand) {
        String rnaStrand = new String();
        for (char nucleotide : strand.toCharArray()) {
            rnaStrand += RnaTranscription.ofNucleotide(nucleotide);
        }
        return rnaStrand;
    }

    private static String ofNucleotide(char nucleotide) {
        switch (nucleotide) {
            case 'G': return "C";
            case 'C': return "G";
            case 'T': return "A";
            case 'A': return "U";
            default: return "";
        }
    }
}
