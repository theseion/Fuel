baselines
baseline: spec

	<baseline>
	spec for: #common do: [
		spec
			package: 'Fuel-Core';
			package: 'Fuel-Core-Tests' with: [ spec requires: 'Core' ].

		spec
			group: 'Core' with: #( 'Fuel-Core' );
			group: 'Tests' with: #( 'Core' 'Fuel-Core-Tests' ) ]
