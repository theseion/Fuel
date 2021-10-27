tests
testCreateClassWithSharedPoolAndMethodReferencingAClassVariableOfIt
	"Tests materialization of a class not defined in the image, with a shared pool and a compiled method that referers to a class side variable of the  sharedPool (NOTE: it will be an identity problem if it isn't a Smalltalk global')"
	
	| aClass materializedClass sharedPool anObject |	
	
	aClass := self classFactory silentlyNewClass.
	anObject := Object new.
	
	sharedPool := self classFactory newSubclassOf: SharedPool.
	sharedPool addClassVarNamed: 'ClassVar1'.
	self classFactory
		silentlyCompile: 'classVar1: a  ClassVar1 := a.' in: sharedPool class;
		silentlyCompile: 'classVar1 ^  ClassVar1' in: sharedPool class.
	sharedPool perform: #classVar1: with: anObject.
	
	aClass addSharedPool: sharedPool.	
	self classFactory
		silentlyCompile:  'xxx ^ ClassVar1.' in: aClass;
		silentlyCompile: 'yyy ^ ClassVar1.' in: aClass class.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: aClass.

	self assert: 1 equals: materializedClass sharedPools size.
	self assert: sharedPool identicalTo: materializedClass sharedPools first.
	self assert:  ((materializedClass >> #xxx) literalAt: 1) value identicalTo: (sharedPool classPool at: #ClassVar1).
	self assert:  ((materializedClass class >> #yyy) literalAt: 1) value identicalTo: (sharedPool classPool at: #ClassVar1).
	self assert: (materializedClass new perform: #xxx) identicalTo: anObject.
	self assert: (materializedClass perform: #yyy) identicalTo: anObject