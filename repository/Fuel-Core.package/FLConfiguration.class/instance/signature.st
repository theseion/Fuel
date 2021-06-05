accessing
signature
	^ self
		at: #signature
		ifAbsentPut: [ self class defaultSignature ]