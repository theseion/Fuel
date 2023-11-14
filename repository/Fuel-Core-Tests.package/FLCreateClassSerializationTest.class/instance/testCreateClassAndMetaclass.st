tests
testCreateClassAndMetaclass
	"Tests materialization of a class or trait not defined in the image and that the metaclass is also created."

	| class materializedClass environment name metaclassName metaclass package packageTag |
	class := self classFactory silentlyNewClass.
	environment := class environment.
	package := class package.
	packageTag := class packageTag.
	name := class name.
	metaclassName := class class name.
	metaclass := class class.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: class.

	self assert: environment identicalTo: materializedClass environment.

	self assert: package identicalTo: materializedClass package.
	self assert: packageTag name equals: materializedClass packageTag name.
	self assert: name equals: materializedClass name.
	"Notice that the metaclass is serialized by Fuel and a new one will be created."
	self assert: metaclassName equals: materializedClass class name.
	self deny: metaclass identicalTo: materializedClass class.

	"It is important to notice that (at this moment) Fuel does not add the materialized class or trait into Smalltalk globals"
	self deny: (self environmentOfTest includesKey: name)