tests-change
testBlockClosureRemovedConstant
	"Raise no error when materializing a constant closure whose method was removed."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 42 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assert: aClosure outerContext isNil.
	self assert: aClosure class equals: (Smalltalk at: #ConstantBlockClosure).
	
	self serialize: aClosure.
	aClass removeSelectorSilently: #methodWithClosure.
	self shouldnt: [ self materialized ] raise: FLMethodNotFound