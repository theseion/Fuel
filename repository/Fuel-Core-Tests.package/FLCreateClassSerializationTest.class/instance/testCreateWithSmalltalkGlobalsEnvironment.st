tests
testCreateWithSmalltalkGlobalsEnvironment
	"Tests materialization of a class or trait not defined in the image, and with Smalltalk globals  in the instance variable 'environment'. In that case, the whole Smalltalk globals should NOT be fully serialized but only a reference to the globals should be stored. "

	| aClassOrTrait materializedClassOrTrait category name |
	aClassOrTrait := self classFactory silentlyNewClass.
	aClassOrTrait environment: Smalltalk globals.
	category := aClassOrTrait category.
	name := aClassOrTrait name.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self assert: materializedClassOrTrait basicEnvironment identicalTo: Smalltalk globals.

	self assert: category equals: materializedClassOrTrait category.
	self assert: name equals: materializedClassOrTrait name