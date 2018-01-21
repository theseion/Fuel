private
newNodeFor: anObject
	^ (ROElement on: anObject)
			extent: self nodeExtent;
			addShape: (ROCircle new color: (self colorFor: anObject));
			"addShape: (ROBox new color: Color white; borderColor: Color black) ;"
			"addShape: ROLabel;"
			addInteraction: RODraggable;
			addInteraction: (ROPopup text: #printString);
			on: ROMouseRightClick do: [ :e | anObject inspect ];
			yourself