extension Module.Import {
    /// The visibility modifier applied to a Swift import declaration.
    public enum Visibility: Hashable, Sendable {
        /// A module-internal import, visible only within the importing module.
        case `internal`

        /// A public import, re-exposing the imported module's API to downstream clients.
        case `public`

        /// An `@_exported` import, transparently re-exporting the module as part of this one.
        case exported
    }
}
