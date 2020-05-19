serialize/materialize
serializeInstance: aCompiledBlock with: anEncoder
	| header size cmSize cmInitialPC |

	header := aCompiledBlock header.
	cmSize := aCompiledBlock size.
	cmInitialPC := aCompiledBlock initialPC.
	size := cmSize - cmInitialPC + 1.

	anEncoder 
		encodeInt64: header; "Signed int as of Pharo 40"
		encodeUint16: size.	

	cmInitialPC to: cmSize
		do: [ :index | anEncoder encodeByte: (aCompiledBlock at: index) ]