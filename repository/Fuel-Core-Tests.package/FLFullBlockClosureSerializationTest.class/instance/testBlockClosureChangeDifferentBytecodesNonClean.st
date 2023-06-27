tests
testBlockClosureChangeDifferentBytecodesNonClean
	"Raise an error when materializing a non-clean closure whose method has changed bytecodes."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ self + 1 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self deny: aClosure isClean.
	self assert: aClosure outerContext notNil.
	
	self serializer fullySerializeMethod: aClosure compiledBlock method.
	self serialize: aClosure.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ 43'
		in: aClass.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized