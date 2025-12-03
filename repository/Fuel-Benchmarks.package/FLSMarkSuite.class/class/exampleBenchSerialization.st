examples
exampleBenchSerialization
	
	| samples runner |
	{ 50. 500. 5000. 50000. "500000" } do: [ :problemSize |
		samples := Array streamContents: [ :stream |
			{
			FLNumberSampleFactory. #smallIntegers.
			FLStructureSampleFactory. #completeGraph.
			FLStructureSampleFactory. #regularGraphOfFixedDegree.
			FLCommonSampleFactory. #points.
			FLNumberSampleFactory. #floats.
			} pairsDo: [ :a :b |
				stream nextPut: (a sampleNamed: b problemSize: problemSize) ] ].

	runner := SMarkCogRunner new.
	runner iterations: 3.
	runner problemSize: problemSize.

	samples do: [ :each | 
		| suite |
		"ScriptConsole << 'ProblemSize: '; print: each problemSize."
		suite :=
			FLSMarkSuite new
				runOnly: #benchSerialization;
				sample: each;
				runner: runner;
				yourself.

		runner suite: suite; execute ].
	
	runner reportConfiguration: ScriptConsole; report.
	ScriptConsole cr; flush ]