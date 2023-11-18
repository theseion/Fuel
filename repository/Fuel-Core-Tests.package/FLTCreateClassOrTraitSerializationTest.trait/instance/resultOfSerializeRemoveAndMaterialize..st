helpers
resultOfSerializeRemoveAndMaterialize: aClass
	| wasSilent |
	self fullySerialize: aClass.
	wasSilent := self classFactory createdSilently includes: aClass.
	self classFactory delete: aClass.
	^ self materializeSilently: wasSilent