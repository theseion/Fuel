baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [              
		spec
			package: 'Fuel-Preview' with: [ spec requires: #('Fuel-Debug' 'Roassal') ].
		
		self roassal: spec.

		spec
			group: 'CoreWithExtras' with: #('Core' 'Fuel-ProgressUpdate');
			group: 'DevelopmentGroup' with: #(
				'CoreWithExtras'
				'Fuel-Debug'
				'Tests'
				'Fuel-Tests-ProgressUpdate'
				'Fuel-Tests-Debug');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks');
			group: 'BenchmarksTests' with: #('Benchmarks' 'Fuel-Tests-Benchmarks') ]