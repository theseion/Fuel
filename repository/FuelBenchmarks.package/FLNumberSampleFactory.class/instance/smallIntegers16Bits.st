samples
smallIntegers16Bits

	| number |
	number := 1 << 15.
	^ (number negated to: number by: 2 * number / self problemSize) collect: [ :n | n floor ]