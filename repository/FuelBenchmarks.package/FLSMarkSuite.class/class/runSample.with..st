benchmarking
runSample: aSample with: anInteger
	"Execute the suite one time."

	^ self defaultRunner 
		execute: (self new sample: aSample; yourself)
		with: anInteger