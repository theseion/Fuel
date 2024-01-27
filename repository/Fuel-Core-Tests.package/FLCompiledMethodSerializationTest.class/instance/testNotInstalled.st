tests
testNotInstalled
	| materialized |
	"Since Pharo 3.0 decompilation of compiled methods is no longer possible.
	That means we have to store the source too."
	self useNotInstalled.
	
	self deny: theCompiledMethod isInstalled.
	self deny: theCompiledMethod isDoIt.
	self deny: theCompiledMethod hasSourcePointer.
	
	materialized := self resultOfSerializeAndMaterialize: theCompiledMethod.
	self deny: materialized isInstalled.
	self deny: materialized isDoIt.
	"we serialized the source, trailer is empty"
	self assert: materialized sourceCode isNotNil.
	self deny: materialized hasSourcePointer.
	
	self assert: (materialized isEqualRegardlessTrailerTo: theCompiledMethod)