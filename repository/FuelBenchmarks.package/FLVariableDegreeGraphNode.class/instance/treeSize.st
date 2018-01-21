accessing
treeSize

	^ 1 + (self children inject: 0 into: [ :sum :node | sum + node treeSize ])