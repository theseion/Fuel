helper
benchmarkNameForSelector: selector
	^ (super benchmarkNameForSelector: selector), '--', sample title, '--', (streamFactory name copyWithoutAll: ' ')