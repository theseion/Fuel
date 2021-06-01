tests-change
testBlockClosureChangeSameBytecodes
	"Tolerate materializing a closure whose method has changed but not the bytecodes."

	| aClass aClosure materializedClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 41 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self serialize: aClosure.
	self classFactory
		silentlyCompile:  'methodWithClosure  ^ [ 42 ]'
		in: aClass.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.
	self assert: materializedClosure value equals: 42