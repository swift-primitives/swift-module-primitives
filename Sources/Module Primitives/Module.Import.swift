extension Module {
    /// A parsed import statement from a Swift source file.
    public struct Import: Hashable, Sendable {
        public let module: Module.Name
        public let visibility: Visibility

        public init(module: Module.Name, visibility: Visibility = .internal) {
            self.module = module
            self.visibility = visibility
        }
    }
}
