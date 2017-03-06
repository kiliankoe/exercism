public class Pangrams {
    public static Boolean isPangram(String phrase) {
        String alphabet = new String("abcdefghijklmnopqrstuvwxyz");

        phrase = phrase.toLowerCase();

        for (Character letter : alphabet.toCharArray()) {
            String letterStr = Character.toString(letter);
            if (!phrase.contains(letterStr)) {
                return false;
            }
        }
        return true;
    }
}
