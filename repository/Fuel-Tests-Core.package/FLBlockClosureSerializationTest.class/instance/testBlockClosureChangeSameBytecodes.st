tests-change
testBlockClosureChangeSameBytecodes
	"Tolerate materializing a closure whose method has changed but not the bytecodes."

	| aClass aClosure materializedClosure |
	aClass := self newClass
		duringTestCompileSilently: 'methodWithClosure  ^ [ 41 ]';
		yourself.
	aClosure := aClass new perform: #methodWithClosure.

	self serialize: aClosure.
	aClass duringTestCompileSilently: 'methodWithClosure  ^ [ 42 ]'.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.

	"If the block is a full block it will be serialized independently of the method.
	The method may be the same, but the CompiledBlock is different"
	aClosure isFullBlock 
		ifTrue: [ self assert: materializedClosure value equals: 41 ]
		ifFalse: [ self assert: materializedClosure value equals: 42 ]