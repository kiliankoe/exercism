package hello

import "fmt"

const testVersion = 2

// HelloWorld says hello to the given name or defaults to greet the "World".
func HelloWorld(name string) string {
	if name != "" {
		return fmt.Sprintf("Hello, %s!", name)
	}
	return "Hello, World!"
}
