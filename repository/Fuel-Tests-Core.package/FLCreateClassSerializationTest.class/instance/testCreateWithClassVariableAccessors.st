tests
testCreateWithClassVariableAccessors
	"Tests materialization of a compiled method in a class not defined in the image. The class defines accessors for a class variable."
	
	| aClass materializedClass instance |	
	aClass := self classFactory silentlyNewClassWithClassVariableNames: 'AnFLClassVariable'.
	self classFactory
		silentlyCompile:  'classVariable ^AnFLClassVariable' in: aClass;
		silentlyCompile: 'classVariable: value AnFLClassVariable := value' in: aClass.
	(self newInstanceFrom: aClass) classVariable: 42.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: aClass.
	instance := self newInstanceFrom: materializedClass.

	self assert: (materializedClass includesSelector: #classVariable).
	self assert: 42 equals: instance classVariable.
	instance classVariable: 0.
	self assert: 0 equals: instance classVariable