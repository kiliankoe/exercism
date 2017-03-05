fun hello(name: String = "World"): String {
    if (name.trim().isEmpty()) {
        return "Hello, World!"
    }
    return "Hello, $name!"
}
