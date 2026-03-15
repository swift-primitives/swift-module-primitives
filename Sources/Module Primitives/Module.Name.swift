extension Module {
    /// The identity of a Swift module.
    ///
    /// Stores the canonical underscore form used in import statements.
    public struct Name: Hashable, Sendable {
        public let value: String

        public init(_ value: String) {
            self.value = value
        }

        /// Creates a module name from a SwiftPM product name.
        ///
        /// Converts spaces to underscores: `"Buffer Primitives"` becomes `"Buffer_Primitives"`.
        public init(product name: String) {
            self.value = name.replacing(" ", with: "_")
        }
    }
}
