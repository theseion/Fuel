I am a serialization which facilitates debugging, by logging the stream position before and after main steps of FLSerialization, including cluster information. Obviously, you should be familiar with such class and the algorithm to understand the output log.

To use, send #setDebug to your serializer and run as usually. For example:

FileStream forceNewFileNamed: 'debug.fuel' do: [:aFile |
	FLSerializer newDefault
		setDebug;
		serialize: 'hello' on: aFile binary ]

Then, inspect the output log:

FLDebugSerialization last log