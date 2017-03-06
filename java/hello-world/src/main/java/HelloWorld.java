public class HelloWorld {
    public static String hello(String name) {
        if (name == null || name.equals("")) {
            name = "World";
        }
        return "Hello, " + name + "!";
    }
}
