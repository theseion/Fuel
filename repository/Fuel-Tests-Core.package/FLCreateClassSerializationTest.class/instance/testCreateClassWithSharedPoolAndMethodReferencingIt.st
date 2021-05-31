tests
testCreateClassWithSharedPoolAndMethodReferencingIt
	"Tests materialization of a class not defined in the image, with a shared pool and a compiled method that referers to an Association with such sharedPool (NOTE: it will be an identity problem if it isn't a Smalltalk global')"
	
	| aClass materializedClass sharedPool materializedMethod literalIndex |	
	aClass := self classFactory silentlyNewClass.
	sharedPool := self classFactory newSubclassOf: SharedPool.
	aClass addSharedPool: sharedPool.
	aClass class duringTestCompileSilently: 'initialize ', sharedPool name asString, ' name.'.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: aClass.
	materializedMethod := materializedClass class >> #initialize.
	literalIndex := materializedMethod literals indexOf: (self class bindingOf: sharedPool name).

	self assert: 1 = (materializedClass sharedPools size).
	self assert: sharedPool == materializedClass sharedPools first.
	self assert:  (materializedMethod literalAt: literalIndex) value == sharedPool.