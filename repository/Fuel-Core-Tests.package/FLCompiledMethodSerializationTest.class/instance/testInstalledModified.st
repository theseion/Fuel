tests
testInstalledModified
	| copy materialized |
	"Since Pharo 3.0 decompilation of compiled methods is no longer possible.
	That means we have to store the source too."
	self useInstalled.

	self assert: theCompiledMethod isInstalled.
	self deny: theCompiledMethod isDoIt.
	self assert: theCompiledMethod hasSourcePointer.

	copy := theCompiledMethod copy.
	"different instance can not be installed at the same time."
	self deny: copy isInstalled.
	self deny: copy isDoIt.
	self deny: theCompiledMethod sourceCode isNil.
	self assert: copy hasSourcePointer.

	"if installed but not different, the installed instance will be answered"
	materialized := self resultOfSerializeAndMaterialize: copy.
	self deny: materialized identicalTo: theCompiledMethod.
	self deny: materialized identicalTo: copy.
	self deny: materialized isInstalled.
	self deny: materialized isDoIt.
	"we serialized the source"
	self assert: materialized sourceCode notNil.