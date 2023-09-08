tests
testCreateClassWithSharedPoolAndMethodReferencingIt
	"Tests materialization of a class not defined in the image, with a shared pool and a compiled method that referers to an Association with such sharedPool (NOTE: it will be an identity problem if it isn't a Smalltalk global')"

	| aClass materializedClass sharedPool materializedMethod literalIndex |
	aClass := self classFactory silentlyNewClass.
	sharedPool := self classFactory make: [ :aBuilder | aBuilder superclass: SharedPool ].
	aClass addSharedPool: sharedPool.
	self classFactory silentlyCompile: 'initialize ' , sharedPool name asString , ' name.' in: aClass class.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: aClass.
	materializedMethod := materializedClass class >> #initialize.
	literalIndex := materializedMethod literals indexOf: (self environmentOfTest bindingOf: sharedPool name).

	self assert: materializedClass sharedPools size equals: 1.
	self assert: sharedPool identicalTo: materializedClass sharedPools first.
	self assert: (materializedMethod literalAt: literalIndex) value identicalTo: sharedPool