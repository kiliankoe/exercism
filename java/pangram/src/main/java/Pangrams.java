public class Pangrams {
    public static Boolean isPangram(String phrase) {
        phrase = phrase.toLowerCase();

        for (Character letter = 'a'; letter <= 'z'; letter++) {
            if (phrase.indexOf(letter) == -1) {
                return false;
            }
        }
        return true;
    }
}
