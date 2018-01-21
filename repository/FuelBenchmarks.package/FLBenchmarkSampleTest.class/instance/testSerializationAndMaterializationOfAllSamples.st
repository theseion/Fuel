tests
testSerializationAndMaterializationOfAllSamples
	"Tests that the result of serialization and materialization of every sample does not raise an error and that it has the expected size. Would be nice to check if the result is equal but many classes do not have = well defined for us."

	FLSampleFactory allSamples 
		do: [ :aSample | self testSample: aSample ]