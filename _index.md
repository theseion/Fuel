+++
type = "docs"
+++

# Basic examples
We give some class-side messages to facilitate the more common uses of serialization and materialization. The next example writes and reads from file:
```smalltalk
FLSerializer serialize: 'stringToSerialize' toFileNamed: 'demo.fuel'.
materializedString := FLMaterializer materializeFromFileNamed: 'demo.fuel'.
```

We also provide messages for storing into a `ByteArray`. This can be fine for users of a NoSQL database:
```smalltalk
anArray := FLSerializer serializeToByteArray: 'stringToSerialize'. 
materializedString := FLMaterializer materializeFromByteArray: anArray.
```

## FileStream
In this example we work with files. Note that we set the file in binary mode:
```smalltalk
FileStream forceNewFileNamed: 'demo.fuel' do: [:aStream |
	FLSerializer newDefault 
		serialize: 'stringToSerialize' 
 		on: aStream binary].

FileStream oldFileNamed: 'demo.fuel' do: [:aStream |
	materializedString := (FLMaterializer newDefault 
		materializeFrom: aStream binary) root].
```
Note also that we are no longer using the class-side messages of previous examples. Now, for both FLSerializer and FLMaterializer, we first create instances with #newDefault to then perform the desired operations. As we will see in next example, creating the instances brings more possibilities.
## Compressing
Of course, you could use stream compressors provided by the system. However, we have detected some errors serializing WideStrings. An example of use:
```smalltalk
FileStream forceNewFileNamed: 'number.fuel.zip' do: [:aFileStream | 
	|gzip|
	aFileStream binary.
	gzip := GZipWriteStream on: aFileStream.
	FLSerializer newDefault serialize: 123 on: gzip.
	gzip close. ].
FileStream oldFileNamed: 'number.fuel.zip' do: [:aFileStream | 
	|gzip|
	aFileStream binary.
	gzip := GZipReadStream on: aFileStream.		
	materialization := FLMaterializer newDefault 
		materializeFrom: gzip.
	gzip close. ].
```
## Showing a progress bar
Sometimes it is nice to see progress updates on screen. Use #showProgress in this cases.
```smalltalk
FileStream forceNewFileNamed: 'numbers.fuel' do: [:aStream |
	FLSerializer newDefault 
		showProgress;
		serialize: (1 to: 200000) asArray 
		on: aStream binary ].
	
FileStream oldFileNamed: 'numbers.fuel' do: [:aStream | 
	FLMaterializer newDefault 
		showProgress;
		materializeFrom: aStream binary ].
```
Package FuelProgressUpdate must be installed. You can use:
```smalltalk
(ConfigurationOfFuel project version: '1.9') 
	load: 'FuelProgressUpdate'.
```
