import Testing
@testable import Module_Primitives

@Suite
struct ModuleNameTests {
    @Test
    func `direct construction preserves value`() {
        let name = Module.Name("Buffer_Primitives")
        #expect(name.value == "Buffer_Primitives")
    }

    @Test
    func `product construction converts spaces to underscores`() {
        let name = Module.Name(product: "Buffer Primitives")
        #expect(name.value == "Buffer_Primitives")
    }

    @Test
    func `product construction with no spaces`() {
        let name = Module.Name(product: "Foundation")
        #expect(name.value == "Foundation")
    }

    @Test
    func `equality based on value`() {
        let a = Module.Name("Foo")
        let b = Module.Name(product: "Foo")
        #expect(a == b)
    }

    @Test
    func `product with multiple spaces`() {
        let name = Module.Name(product: "Graph Reachable Primitives")
        #expect(name.value == "Graph_Reachable_Primitives")
    }
}
