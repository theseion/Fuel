baselines-helpers
groupsForSqueakCommon: spec
	spec for: #squeak do: [
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'CoreWithExtras' with: #('Core' 'Fuel-ProgressUpdate');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks') ]