tests-configuring-stream
testDecorateStreamFactory
	| byteConverterStream string |
	byteConverterStream := self classFactory silentlyNewSubclassOf: DecoratorStream.
	self classFactory
		silentlyCompile: 'nextPut: anInteger
			decoratedStream nextPut: (Character value: anInteger)'
		in:  byteConverterStream.
		
	string := String new: 3.
	serializer := FLSerializer new
		streamFactory: [ string writeStream ];
		decorateStreamFactory: [ :stream | byteConverterStream on: stream ];
		yourself.
	
	serializer streamFactory value
		nextPut: $f asciiValue;
		nextPut: $o asciiValue;
		nextPut: $o asciiValue.
	self assert: string equals: 'foo'.
	
	string := String new: 3.
	serializer := FLMaterializer new
		streamFactory: [ string writeStream ];
		decorateStreamFactory: [ :stream | byteConverterStream on: stream ];
		yourself.
	
	serializer streamFactory value
		nextPut: $f asciiValue;
		nextPut: $o asciiValue;
		nextPut: $o asciiValue.
	self assert: string equals: 'foo'