testing
shouldSerializeCompiledMethodFully: aCompiledMethod
	"Answers true when aCompiledMethod must be fully serialized, and false otherwise.
	Methods that can be looked up in the environment must not be fully serialized.
	The following methods must be fully serialized:
		- methods that are included in the classes considered as internal
		- methods considered internal
		- methods that are DoIts"

	^ (self shouldSerializeBehaviorFully: aCompiledMethod methodClass) or: [
		(internalMethods includes: aCompiledMethod) or: [
			aCompiledMethod isInstalled not or: [
				aCompiledMethod isDoIt ] ] ]