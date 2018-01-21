I am a materialization which facilitates debugging, by logging the stream position before and after main steps of FLMaterialization, including cluster information. Obviously, you should be familiar with such class and the algorithm to understand the output log.

To use, send #setDebug to your serializer and run as usually. For example:

FileStream oldFileNamed: 'debug.fuel' do: [:aFile |
	FLMaterializer newDefault
		setDebug;
		materializeFrom: aFile binary ]

Then, inspect the output log:

FLDebugMaterialization last log