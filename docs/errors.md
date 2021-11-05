We provide a hierarchy of errors which allow to clearly identify the problem if something went wrong:
- FLError
  - FLSerializationError
    - FLNotSerializable
    - FLObjectNotFound
    - FLObsolete
  - FLMaterializationError
    - FLBadSignature
    - FLBadVersion
    - FLClassNotFound
    - FLGlobalNotFound
    - FLMethodChanged
    - FLMethodNotFound
As most classes of Fuel, they have class comments that give an idea their meanings:
## FLError
I represent an error produced during Fuel operation.
## FLSerializationError
I represent an error happened during serialization.
## FLNotSerializable
I represent an error which may happen while tracing in the graph an object that is forbidden of being serialized.
## FLObjectNotFound
I represent an error which may happen during serialization, when trying to encode on the stream a reference to an object that should be encoded before, but it is not. This usually happens when the graph changes during serialization. Another possible cause is a bug in the analysis step of serialization.
## FLObsolete
I am an error produced during serialization, signaled when trying to serialize an obsolete class as global. It is a prevention, because such class is likely to be absent during materialization.
## FLMaterializationError
I represent an error happened during materialization.
## FLBadSignature
I represent an error produced during materialization when the serialized signature doesn't match the materializer's signature (accessible via `FLMaterializer>>signature`). A signature is a byte prefix that should prefix a well-serialized stream.
## FLBadVersion
I represent an error produced during materialization when the serialized version doesn't match the materializer's version (accessible via `FLMaterializer>>version`). A version is encoded in 16 bits and is encoded heading the serialized stream, after the signature.
## FLClassNotFound
I represent an error produced during materialization when a serialized class or trait name doesn't exist.
## FLGlobalNotFound
I represent an error produced during materialization when a serialized global name doesn't exist (see `FLConfiguration>>environment`).
## FLMethodChanged
I represent an error produced during materialization when is detected a change in the bytecodes of a method serialized. This error was born when testing the materialization of a `BlockClosure` defined in a method that changed, and produced a VM crash. See `FLConfiguration>>isMethodChangedWarningDisabled`).
## FLMethodNotFound
I represent an error produced during materialization when a serialized method in a class or trait name doesn't exist (see `FLConfiguration>>environment`).