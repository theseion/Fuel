baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [              
		spec
			package: 'Fuel-Preview' with: [ spec requires: #( 'Fuel-Debug' 'Roassal')];
			package: 'Fuel-Metalevel' with: [ spec requires: #( 'Fuel' )];
			package: 'Fuel-Metalevel-Tests' with: [ spec requires: #('Fuel-Metalevel' 'Fuel-Tests' ) ].
		
		self roassal: spec.

		spec
			group: 'CoreWithExtras' with: #('Core'  'Fuel-Metalevel' 'Fuel-ProgressUpdate');
			group: 'Tests' with: #('Fuel-Tests' );
			group: 'DevelopmentGroup' with: #('CoreWithExtras' 'Tests' 'Fuel-Metalevel-Tests' 'Fuel-Debug') ]