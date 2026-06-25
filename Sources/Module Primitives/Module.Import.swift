extension Module {
    /// A parsed import statement from a Swift source file.
    public struct Import: Hashable, Sendable {
        /// The module named by the import statement.
        public let module: Module.Name

        /// The visibility modifier applied to the import.
        public let visibility: Visibility

        /// Creates an import of the given module with the specified visibility.
        public init(module: Module.Name, visibility: Visibility = .internal) {
            self.module = module
            self.visibility = visibility
        }
    }
}
