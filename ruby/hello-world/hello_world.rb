class HelloWorld
  def self.hello(name = nil)
    name ||= "World"
    return "Hello, #{name}!"
  end
end
