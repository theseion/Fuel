samples
floats

	| temp |
	temp := 1.1.
	^ (1 to: self problemSize) collect: [ :i | temp := temp negated. i * temp ]
