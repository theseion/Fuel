accessing
signature
	^ map
		at: #signature
		ifAbsentPut: [ self class defaultSignature ]