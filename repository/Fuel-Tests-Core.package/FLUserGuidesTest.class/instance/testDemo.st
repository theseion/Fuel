tests-Getting Started
testDemo
	| sourceArray loadedArray |
	sourceArray := Array
		with: 'a string'
		with: Smalltalk
		with: [
			Smalltalk vm.
			'a string' ].
	"Store to the file"
	FLSerializer new
		fileName: 'example.FL';
		object: sourceArray;
		serialize.
	"Load from the file"
	loadedArray := FLMaterializer new
		fileName: 'example.FL';
		materialize.
	"The arrays are not the same"
	self assert: sourceArray ~~ loadedArray.
	"The strings are not the same"
	self assert: sourceArray first ~~ loadedArray first.
	self assert: sourceArray first equals: loadedArray first.
	"The global instance Smalltalk is the same"
	self assert: sourceArray second identicalTo: loadedArray second.
	"Evaluating the loaded block prints a string"
	self assert: loadedArray third value equals: 'a string'