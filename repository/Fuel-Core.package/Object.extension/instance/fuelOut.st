*Fuel-Core
fuelOut
	| target |
	target := FileLocator imageDirectory / self printString asFileName, 'fuel'.
	self serializeToFileNamed: target nextVersion fullName