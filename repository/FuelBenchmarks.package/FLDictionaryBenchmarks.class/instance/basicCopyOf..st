private
basicCopyOf: anObject
	"Code extracted  from Object>>shallowCopy"

	|class newObject index |

	class := anObject class.
	class isVariable
		ifTrue: 
			[index := anObject basicSize.
			newObject := class basicNew: index.
			[index > 0]
				whileTrue: 
					[newObject basicAt: index put: (anObject basicAt: index).
					index := index - 1]]
		ifFalse: [newObject := class basicNew].
	index := class instSize.
	[index > 0]
		whileTrue: 
			[newObject instVarAt: index put: (anObject instVarAt: index).
			index := index - 1].
	^ newObject