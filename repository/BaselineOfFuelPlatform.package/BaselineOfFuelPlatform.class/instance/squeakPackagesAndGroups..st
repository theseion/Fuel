helpers
squeakPackagesAndGroups: spec
	spec for: #squeak do: [
		spec package: 'Fuel-Platform-Squeak-Core' with: [ spec requires: 'FuelPlatform-Core' ] ].
	spec for: #'squeak4.x' do: [
		spec package: 'Fuel-Platform-Squeak-04x' with: [ spec requires: 'Fuel-Platform-Squeak-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Squeak-04x' ].
	spec for: #'squeak5.x' do: [
		spec package: 'Fuel-Platform-Squeak-05' with: [ spec requires: 'Fuel-Platform-Squeak-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Squeak-05' ].
	spec for: #'squeak6.x' do: [
		spec package: 'Fuel-Platform-Squeak-06' with: [ spec requires: 'Fuel-Platform-Squeak-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Squeak-06' ]