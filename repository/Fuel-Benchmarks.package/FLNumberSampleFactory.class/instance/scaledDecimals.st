samples
scaledDecimals

	^ (self floats first: self problemSize // 10) collect: [:f | f asScaledDecimal ]