*Fuel-Preview
openPathsToEvery: anUnaryBlock

	| builder |
	builder := FLGraphViewBuilder new.

	(self references 
		collect: [:a | a value ] 
		thenSelect: [:o | anUnaryBlock value: o])
		do: [:o | builder mark: o with: self secondaryColor].

	builder
		mark: self root with: self rootColor;
		references: (self pathsToEvery: anUnaryBlock);
		open