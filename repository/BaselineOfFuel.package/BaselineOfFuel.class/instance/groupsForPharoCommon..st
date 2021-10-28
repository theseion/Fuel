baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [
		spec
			group: 'DevelopmentGroup' with: #(
				'Debug'
				'Tests'
				'Fuel-Tests-ProgressUpdate'
				'Fuel-Tests-Debug');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks' 'Fuel-Tests-Benchmarks') ]