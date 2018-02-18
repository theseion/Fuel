private
open
	"See class comment."
	
	| view nodes edges stack |
	edges := references collect: [:association | self edgeFor: association ].
	nodes := elementByObjectMap values.

	view := ROView new.
	view addAll: edges.
	view addAll: nodes.
	

	self setInteractionOn: nodes edges: edges.

	ROForceBasedLayout new layoutInitial: ROGridLayout; on: nodes.
	view 
		@ RODraggable;
		@ RODraggableWithVelocity.
	
	stack := ROViewStackWithMenu new.
	stack zoomInButton ; zoomOutButton ; findButton.
	stack addMenu: 'Info' callBack: [ self openInfo ].
	stack addMenu: 'Remove...' callBack: [ self removeButtonView: view ].
	stack addView: view.
	
	stack add: ((ROElement new + (ROImage new form: [ :k | self fuelIcon ])) translateBy: 0@400 ).
	
	stack open.