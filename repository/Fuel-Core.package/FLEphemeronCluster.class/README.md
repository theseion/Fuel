I am responsible for serializing and materializing ephemerons. Ephemerons are subclasses of Association with the EphemeronLayout class layout. The garbage collector finalizes ephemerons (called "mourning") when no strong references to the key of the association remain.

See the class comment of FinalizationRegistryEntry for additional information.

I only serialize the ephemeron's key if there's also a strong reference to it from within the graph, as otherwise the garbage collector would finalize and collect the ephemeron immediately during materialization.