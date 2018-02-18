samples
positiveLargeIntegers

	| maxLarge minLarge |
	minLarge := SmallInteger maxVal + 1.
	maxLarge := (SmallInteger maxVal + 1) << 32.
	^ (minLarge to: maxLarge by: (maxLarge - minLarge) // self problemSize) asArray