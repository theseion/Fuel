tests
testDoIt
	| materialized |
	self useDoIt.

	theCompiledMethod selector: #DoIt.
	self assert: theCompiledMethod isDoIt.
	self assert: theCompiledMethod isInstalled.
	self deny: theCompiledMethod sourceCode isNil.
	self deny: theCompiledMethod hasSourcePointer.

	materialized := self resultOfSerializeAndMaterialize: theCompiledMethod.
	"not possible since it's a different instance"
	self deny: materialized isInstalled.
	self assert: materialized isDoIt.
	"we serialized the source, trailer is cleared"
	self assert: materialized sourceCode notNil.
	self deny: materialized hasSourcePointer.

	self assert: (materialized isEqualRegardlessTrailerTo: theCompiledMethod)