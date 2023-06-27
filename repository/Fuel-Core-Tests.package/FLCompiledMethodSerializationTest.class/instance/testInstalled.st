tests
testInstalled
	| materialized |
	self useInstalled.

	self assert: theCompiledMethod isInstalled.
	self deny: theCompiledMethod isDoIt.
	self deny: theCompiledMethod sourceCode isNil.
	self assert: theCompiledMethod hasSourcePointer.

	"if installed but not different, the installed instance will be answered"
	materialized := self resultOfSerializeAndMaterialize: theCompiledMethod.
	self assert: materialized identicalTo: theCompiledMethod