class and trait names
classNames
	| class |
	class := self at: #Class.
	^ (overlay associations
		select: [ :assoc | assoc value isKindOf: class ]
		thenCollect: [ :assoc | assoc key ]) asSet
			addAll: environment classNames;
			yourself