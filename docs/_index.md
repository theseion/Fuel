+++
type = "docs"
+++

Welcome to Fuel documentation.

Fuel is a general-purpose object serialization framework developed in [Pharo](https://pharo.org), but also works on [Squeak](https://squeak.org/) and other Smalltalks.

Some highlights about Fuel:

##### Concrete
We don't aspire to have a dialect-interchange format. This enables us to serialize special objects like contexts, block closures, exceptions, compiled methods and classes. Although there are ports to other dialects, Fuel development is Pharo-centric.
##### Flexible
Depending on the context, there could be multiple ways of serializing the same object. For example, a class can be considered either a global or a regular object. In the former case, it will be encoded just its name; in the latter case, the class will be encoded in detail, with its method dictionary, etc.
##### Fast
We worry about to have the best performance. Our pickling algorithm allows outstanding materialization performance, as well as very good serialization performance, too. We developed a complete benchmark suite to help analyse the performance with diverse sample sets.
##### Object-Oriented Design
From the begining, it was a constraint to have a good object-oriented design and to do not need any special support from the VM. In addition, Fuel has a complete test suite, with a high coverage. We also worry about writing comments on classes and methods.


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
