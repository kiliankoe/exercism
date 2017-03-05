import org.junit.Ignore
import org.junit.Test
import org.junit.Assert.assertEquals


class HelloWorldTest {

    @Test
    fun helloNoName() {
        assertEquals("Hello, World!", hello())
    }

    @Test
    fun helloSampleName() {
        assertEquals("Hello, Alice!", hello("Alice"))
    }

    @Test
    fun helloBlankName() {
        assertEquals("Hello, World!", hello("    "))
    }

    @Test
    fun helloAnotherSampleName() {
        assertEquals("Hello, Bob!", hello("Bob"))
    }
}
