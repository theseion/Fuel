testing
shouldSerializeCompiledMethodFully: aCompiledMethod
	"Answers true when aCompiledMethod must be considered global, and false otherwise.
	Global methods are those which are NOT included in the classes considered as internal, nor in the methods consider as internal, nor if they are DoIts."

	^ (self shouldSerializeBehaviorFully: aCompiledMethod methodClass) or: [
			(internalMethods includes: aCompiledMethod) or: [
				aCompiledMethod isInstalled not or: [
					aCompiledMethod isDoIt ] ] ]