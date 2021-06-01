tests
testCreateSharedPoolClass
	"Tests materialization of a shared pool class not defined in the image (NOTE: it will be an identity problem if it isn't a Smalltalk global')"
	
	|  materializedClass sharedPool |
	sharedPool := self classFactory newSubclassOf: SharedPool.
	sharedPool addClassVarNamed: 'ClassVar1'.
	self classFactory
		silentlyCompile: 'classVar1: a  ClassVar1 := a.' in: sharedPool class;
		silentlyCompile: 'classVar1 ^  ClassVar1 ' in: sharedPool class.
	
	sharedPool
		perform: #classVar1:
		with: #foo.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: sharedPool.

	self assert: (materializedClass perform: #classVar1) equals: #foo
	