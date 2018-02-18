*Fuel-Preview
openComparison
	"Open a window making easy comparing last instances of serialization and materialization.
	self openComparison.
	"

	| builder contents |
	builder := UITheme builder.
	contents := {FLDebugSerialization last view. FLDebugMaterialization last view}.

	(builder newRow: contents)
		extent: 1000@500;
		openInWindowLabeled: 'Fuel - clusters serialized and materialized.'.
