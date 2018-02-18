samples
smallIntegers8Bits

	| number |
	number := 1 << 7.
	^ (number negated to: number by: 2 * number / self problemSize) collect: [ :n | n floor ]