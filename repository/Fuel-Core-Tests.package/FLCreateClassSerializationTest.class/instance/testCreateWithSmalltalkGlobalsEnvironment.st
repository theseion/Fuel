tests
testCreateWithSmalltalkGlobalsEnvironment
	"Tests materialization of a class or trait not defined in the image, and with Smalltalk globals  in the instance variable 'environment'. In that case, the whole Smalltalk globals should NOT be fully serialized but only a reference to the globals should be stored. "

	| class materializedClass name package packageTag |
	class := self classFactory silentlyNewClass.
	class environment: Smalltalk globals.
	package := class package.
	packageTag := class packageTag.
	name := class name.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: class.

	self assert: materializedClass basicEnvironment identicalTo: Smalltalk globals.

	self assert: package identicalTo: materializedClass package.
	self assert: packageTag name equals: materializedClass packageTag name.
	self assert: name equals: materializedClass name