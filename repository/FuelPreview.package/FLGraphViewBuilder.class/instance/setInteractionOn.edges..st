private
setInteractionOn: nodes edges: edges

	"Highlight the edges when the mouse goes over"
	
	nodes do: [ :n | 
		| connectedNodes |
		connectedNodes := edges select: [ :e | e from == n ] thenCollect: #to.
		n on: ROMouseEnter do: [ :evt |
			ROHighlightElements 
				on: connectedNodes 
				color: Color orange.
		].

		n on: ROMouseLeave do: [ :evt |
			ROUnhighlightElements 
				on: connectedNodes 
		]
	]