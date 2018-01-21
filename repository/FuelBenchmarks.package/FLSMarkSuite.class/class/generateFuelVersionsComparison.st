examples
generateFuelVersionsComparison

	| fuelVersions repetitionNumber runs |
	fuelVersions := #('Fuel-MartinDias.305' 'Fuel-MartinDias.306').
	repetitionNumber := 2.
	FileStream
		forceNewFileNamed: 'benchsClusterizationReificationBis.txt'
		do: [ :benchsFile | 
			"generate runs"
			runs := OrderedCollection new.
			repetitionNumber timesRepeat: [ runs addAll: fuelVersions ].

			"run"
			runs
				do: [ :fuelVersion | 
					(Gofer new)
						version: fuelVersion;
						load.
					FLUtilities cleanUpEverything.
					benchsFile
						nextPutAll: ' === ' , fuelVersion , ' === ';
						cr.
					3 timesRepeat: [ Smalltalk garbageCollect ].
					FLBenchmarks new
						samples: FLSampleFactory primitiveSamples;
						runners: {FLFuelBenchmarkRunner new};
						useMultiByteFileStream;
						run;
						printResultsOn: benchsFile ]
				displayingProgress: [ :fuelVersion | 'Benchmarks batch running version ' , fuelVersion ] ]