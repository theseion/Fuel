private
removeButtonView: view

	| table index cls |
	table := #(Strings SmallInteger Number Float Array).
	index := UIManager default chooseFrom: table title: 'Chose what you want to remove'.
	index = 0 ifTrue:  [ ^ self ].
	
	cls := Smalltalk globals at: (table at: index).
	RORemoveNode suchThat: [ :el | (el model class == cls) ] in: view
	