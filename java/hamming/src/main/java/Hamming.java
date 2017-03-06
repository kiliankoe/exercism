public class Hamming {
    public static int compute(String strandA, String strandB) {
        if (strandA.length() != strandB.length()) {
            throw new IllegalArgumentException();
        }

        int distance = 0;
        for (int i = 0; i < strandA.length(); i++) {
            if (strandA.charAt(i) != strandB.charAt(i)) {
                distance++;
            }
        }

        return distance;
    }
}
