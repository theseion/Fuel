I clusterize CompiledBlocks that belong to CompiledMethods that are considered global (see FLGlobalCompiledMethodCluster).

Before Pharo 9, the bytecode of blocks was stored in the associated CompiledMethod. As of Pharo 9, CompiledBlocks can
exist independantly of an associated CompiledMethod and store their own bytecode. Hence, when a CompiledMethod is considered global, all blocks must be treated equivalently. Otherwise, blocks would be serialized and materialized as normal and evaluating such a block may answer a result different from the actually installed block if the corresponding block was changed in the installed method in the mean time.

See FLBlockClosureSerializationTest>>testBlockClosureChangeDifferentBytecodes and #testBlockClosureChangeSameBytecodes.